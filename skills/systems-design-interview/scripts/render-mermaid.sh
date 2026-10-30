#!/usr/bin/env bash
# Renderiza un diagrama Mermaid a SVG.
# Uso: render-mermaid.sh <entrada.mmd> <salida.svg>
# Salida: 0 = SVG generado; 1 = error de render; 2 = no hay mmdc ni npx.
set -eu

if [ "$#" -ne 2 ]; then
  echo "Uso: $0 <entrada.mmd> <salida.svg>" >&2
  exit 1
fi

in="$1"
out="$2"

if [ ! -f "$in" ]; then
  echo "No existe el archivo de entrada: $in" >&2
  exit 1
fi

# mermaid-cli necesita un navegador; si hay Chrome del sistema, se lo pasamos
# para no descargar Chromium en cada ejecución.
cfg=""
for c in "${CHROME_PATH:-}" \
         "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
         "/Applications/Chromium.app/Contents/MacOS/Chromium" \
         "$(command -v google-chrome 2>/dev/null || true)" \
         "$(command -v google-chrome-stable 2>/dev/null || true)" \
         "$(command -v chromium 2>/dev/null || true)" \
         "$(command -v chromium-browser 2>/dev/null || true)"; do
  if [ -n "$c" ] && [ -x "$c" ]; then
    cfg="$(mktemp "${TMPDIR:-/tmp}/sdi-puppeteer.XXXXXX")"
    printf '{"executablePath": "%s", "args": ["--no-sandbox"]}\n' "$c" > "$cfg"
    break
  fi
done

run() {
  if [ -n "$cfg" ]; then
    "$@" -i "$in" -o "$out" -b white -p "$cfg"
  else
    "$@" -i "$in" -o "$out" -b white
  fi
}

status=0
if command -v mmdc >/dev/null 2>&1; then
  run mmdc >/dev/null 2>&1 || status=1
elif command -v npx >/dev/null 2>&1; then
  PUPPETEER_SKIP_DOWNLOAD="${cfg:+1}" run npx -y @mermaid-js/mermaid-cli >/dev/null 2>&1 || status=1
else
  [ -n "$cfg" ] && rm -f "$cfg"
  echo "No hay mermaid-cli (mmdc) ni npx. Instala Node.js o 'npm i -g @mermaid-js/mermaid-cli'." >&2
  exit 2
fi

[ -n "$cfg" ] && rm -f "$cfg"

if [ "$status" -ne 0 ] || [ ! -s "$out" ]; then
  echo "Error al renderizar $in. Revisa la sintaxis Mermaid." >&2
  exit 1
fi
echo "$out"
