# systems-design-interview

Skill de Claude Code para practicar entrevistas de diseño de sistemas. Claude hace de entrevistador: inventa una empresa con una necesidad tecnológica, responde a tus preguntas con feedback sobre cada una, recibe tu diseño, te hace algunas preguntas de profundización y te evalúa con una nota sobre 100 y un veredicto (Strong Hire, Hire, Lean Hire o No Hire). Al terminar guarda una ficha de la entrevista en Markdown y en PDF.

Hay cuatro niveles: Junior, Mid, Senior y Staff/Principal. Cambian el tamaño del caso, el número de trampas, la ayuda que recibes y la nota necesaria para cada veredicto.

## Instalación

Dentro de Claude Code:

```
/plugin marketplace add mangelsnc/systems-design-interview
/plugin install systems-design-interview@systems-design-interview
```

Después pide algo como "hazme una entrevista de diseño de sistemas de nivel Mid" o invoca el skill con `/systems-design-interview:systems-design-interview`.

Si prefieres instalarlo sin plugin, copia la carpeta `skills/systems-design-interview` en `~/.claude/skills/`.

## Uso

- Al empezar eliges nivel y recibes la descripción del caso. A partir de ahí, pregunta lo que necesites para entender el problema.
- Comandos en lenguaje natural: **pista**, **resumen** (repite lo que has descubierto), **tengo el diseño** y **me rindo**.
- El diseño puedes entregarlo en texto, en Mermaid, en ASCII o como ruta a una imagen o a un `.excalidraw`.

Las fichas se guardan en `~/Systems Design Interviews/YYYY-MM-DD-<empresa>/`. Mientras dura la entrevista, el caso vive en `~/Systems Design Interviews/.en-curso/caso.md`. Si lo abres, te estás destripando la entrevista. Se borra al terminar.

## Dependencias opcionales

| Herramienta | Para qué | Si falta |
|---|---|---|
| Google Chrome o Chromium | Convertir la ficha a PDF | Claude prueba con una herramienta MCP de HTML a PDF si la tienes; si no, recibes `ficha.md` y `ficha.html`. |
| Node.js (`npx`) o `@mermaid-js/mermaid-cli` | Dibujar los diagramas Mermaid en el PDF | Chrome los dibuja cargando Mermaid desde un CDN (necesita red); sin red, el PDF muestra el código. |
| poppler (`pdfinfo`, `pdftoppm`) | Que Claude revise visualmente el PDF | El PDF se genera igual, pero sin revisión visual. |

Si Chrome no está en una ruta estándar, define `CHROME_PATH` con la ruta al ejecutable.

`ficha.md` se genera siempre, aunque falte todo lo anterior.

## Estructura

```
.claude-plugin/               manifiesto del plugin y del marketplace
skills/systems-design-interview/
  SKILL.md                    comportamiento del entrevistador
  references/levels.md          niveles, trampas, pistas y umbrales
  references/rubric.md          rúbrica de puntuación
  references/case-template.md   plantilla del caso oculto
  references/report-template.*  plantillas de la ficha (md y html)
  references/style.md           estilo del PDF
  scripts/render-mermaid.sh     Mermaid → SVG
  scripts/html-to-pdf.sh        HTML → PDF con Chrome/Chromium
```

## Licencia

MIT. Consulta el archivo `LICENSE`.
