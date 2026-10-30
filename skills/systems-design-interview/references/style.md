# Estilo de la ficha en PDF

La ficha es un documento de estudio: sobrio, legible e imprimible en blanco y negro sin perder información. El color solo comunica categoría de pregunta, veredicto y puntuación.

## Tipografía

- Familia: `"Inter", -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif`. Inter se carga desde Google Fonts; si no hay red, el resto de la pila basta.
- Código y Mermaid sin renderizar: `"JetBrains Mono", "SF Mono", Menlo, Consolas, monospace`.
- Cuerpo 10pt, interlineado 1.5. h1 de portada 30pt peso 300. h2 15pt peso 600. h3 11.5pt peso 600.

## Colores (literales, sin `var()` en tablas)

| Uso | Color |
|---|---|
| Texto | `#1a1a1a` |
| Texto secundario | `#5f6368` |
| Bordes y reglas | `#dadce0` |
| Fondo de cabecera de tabla | `#f1f3f4` |
| Portada (fondo) | `#111111`, texto `#ffffff` |

Categorías de pregunta (etiqueta con fondo claro y texto oscuro del mismo tono, para que se distingan también en B/N por la palabra):

| Categoría | Fondo | Texto | Clase |
|---|---|---|---|
| Esperada | `#e6f4ea` | `#137333` | `.q-esperada` |
| Útil | `#e8f0fe` | `#1a56c4` | `.q-util` |
| Dudosa | `#fef7e0` | `#a05a00` | `.q-dudosa` |
| Innecesaria | `#fce8e6` | `#b3261e` | `.q-innecesaria` |
| Prematura | `#f3e8fd` | `#7627bb` | `.q-prematura` |
| Pista / suposición | `#f1f3f4` | `#3c4043` | `.q-otra` |

Veredictos (`.v-strong`, `.v-hire`, `.v-lean`, `.v-nohire`): `#137333`, `#1a56c4`, `#a05a00`, `#b3261e`.

Barras de puntuación: pista `#e8eaed`, relleno `#1a1a1a`, alto 6pt.

## Maquetación para impresión

- `@page { size: A4; margin: 18mm 16mm; }` y `@page :first { margin: 0; }`. La portada es la única excepción a las alturas fijas: `height: 297mm`, `box-sizing: border-box`, `overflow: hidden` y `break-after: page`, para que el fondo oscuro llegue a sangre. En el resto, nada de `min-height: 100vh` ni alturas fijas.
- Medidas en `pt` o `mm`, no en `px` ni `vh`.
- `break-inside: avoid` en filas de tabla, `figure`, bloques de código y tarjetas. Las tablas largas pueden partirse entre páginas; `thead { display: table-header-group; }` para repetir la cabecera.
- `h2 { break-after: avoid; }` para que un título no quede solo al pie.
- `-webkit-print-color-adjust: exact; print-color-adjust: exact;` en `html` para que se impriman fondos y etiquetas.
- Diagramas: SVG enlazado con `<img>` dentro de `<figure>` (no incrustado: mermaid-cli pone el mismo `id` a todos los SVG y sus estilos chocarían), `width: 100%`, `max-height: 200mm`, `object-fit: contain`, centrado.
- Código: fondo `#f8f9fa`, borde `#dadce0` de 0.75pt, sin bloques oscuros a sangre.
- Sin emojis ni iconos decorativos.
