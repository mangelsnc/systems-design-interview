#!/usr/bin/env bash
# Convierte un HTML a PDF A4 con Chrome o Chromium en modo headless.
# Uso: html-to-pdf.sh <entrada.html> <salida.pdf>
# Salida: 0 = PDF generado; 1 = error de conversión; 2 = no hay motor.
# Variables: CHROME_PATH fuerza un ejecutable; SDI_SKIP_APP_PATHS=1 ignora
# las rutas de /Applications (útil para probar la ausencia de motor en macOS).
set -eu

if [ "$#" -ne 2 ]; then
  echo "Uso: $0 <entrada.html> <salida.pdf>" >&2
  exit 1
fi

in="$1"
out="$2"

if [ ! -f "$in" ]; then
  echo "No existe el archivo de entrada: $in" >&2
  exit 1
fi

candidates=()
[ -n "${CHROME_PATH:-}" ] && candidates+=("$CHROME_PATH")
for name in google-chrome google-chrome-stable chromium chromium-browser; do
  p="$(command -v "$name" 2>/dev/null || true)"
  [ -n "$p" ] && candidates+=("$p")
done
if [ "${SDI_SKIP_APP_PATHS:-0}" != "1" ]; then
  candidates+=("/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
  candidates+=("/Applications/Chromium.app/Contents/MacOS/Chromium")
fi

chrome=""
for c in ${candidates[@]+"${candidates[@]}"}; do
  if [ -x "$c" ]; then chrome="$c"; break; fi
done

if [ -z "$chrome" ]; then
  echo "No se ha encontrado Chrome ni Chromium. Instala uno de los dos o define CHROME_PATH." >&2
  exit 2
fi

if [ ! -d "$(dirname "$out")" ]; then
  echo "No existe el directorio de salida: $(dirname "$out")" >&2
  exit 1
fi

abs_in="$(cd "$(dirname "$in")" && pwd)/$(basename "$in")"
abs_out="$(cd "$(dirname "$out")" && pwd)/$(basename "$out")"
url="file://$(printf '%s' "$abs_in" | sed 's/%/%25/g; s/ /%20/g; s/#/%23/g')"
rm -f "$abs_out"
profile="$(mktemp -d "${TMPDIR:-/tmp}/sdi-chrome.XXXXXX")"

"$chrome" --headless --disable-gpu --no-sandbox --no-first-run \
  --user-data-dir="$profile" \
  --no-pdf-header-footer --print-to-pdf-no-header --virtual-time-budget=5000 \
  --print-to-pdf="$abs_out" "$url" >/dev/null 2>&1 || true

rm -rf "$profile"

if [ ! -s "$abs_out" ]; then
  echo "Chrome no ha generado el PDF ($chrome)." >&2
  exit 1
fi
echo "$abs_out"
