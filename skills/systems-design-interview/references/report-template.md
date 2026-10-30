# Plantilla de la ficha (`ficha.md`)

Se escribe al final, a partir del archivo de trabajo. Castellano con tildes, sin emojis, prosa normal en párrafos. Los marcadores `{{...}}` se sustituyen; las secciones vacías se mantienen con una frase que lo diga ("El candidato no hizo preguntas innecesarias").

~~~markdown
# {{Empresa}}

| | |
|---|---|
| Fecha | {{YYYY-MM-DD}} |
| Nivel | {{Nivel}} |
| Nota | **{{total}}/100** |
| Veredicto | **{{Veredicto}}** |
| Pistas | {{n}} ({{−penalización, ya limitada a 15}} puntos) |

## 1. Descripción del caso

{{Texto exacto que vio el candidato}}

## 2. Contexto oculto

{{Datos que había para descubrir, agrupados como en el archivo de trabajo}}

### Trampas

| Trampa | ¿Descubierta? | Cómo se destapaba |
|---|---|---|

## 3. Transcripción de la entrevista

| # | Pregunta | Categoría | Respuesta resumida |
|---|---|---|---|

## 4. Preguntas esperadas

| Pregunta | Peso | ¿Hecha? | Qué destapaba |
|---|---|---|---|

## 5. Preguntas innecesarias

### Las que hizo el candidato

| Pregunta | Por qué no aportaba |
|---|---|

### Las típicas de este caso

| Pregunta | Por qué no aporta |
|---|---|

## 6. Diseño del candidato

{{Texto del diseño}}

{{Diagrama: bloque mermaid, ![diagrama](archivo.png) o enlace al .excalidraw}}

### Profundización

{{Preguntas del entrevistador y respuestas del candidato}}

## 7. Solución de referencia

{{Prosa}}

```mermaid
{{Diagrama de referencia}}
```

## 8. Evaluación

| Dimensión | Puntos | Máximo | Justificación |
|---|---|---|---|
| Descubrimiento de requisitos | | 25 | |
| Calidad de las preguntas | | 15 | |
| Diseño final | | 30 | |
| Trade-offs y justificación | | 15 | |
| Comunicación y proceso | | 15 | |
| Penalización por pistas | −{{p}} | | |
| **Total** | **{{total}}** | **100** | |

**Veredicto: {{Veredicto}}.** {{Una o dos frases que lo justifiquen respecto a los umbrales del nivel. Si hubo rendición, dilo aquí.}}

### Comparación con la referencia

{{Dónde coincide, dónde diverge y si la divergencia es válida}}

## 9. Cómo mejorar las preguntas

{{Preguntas esperadas que faltaron y qué habrían cambiado; dos o tres preguntas reales reformuladas con el porqué}}

## 10. Consejos para la próxima entrevista

1. {{Consejo concreto}}
2. {{Consejo concreto}}
3. {{Consejo concreto}}
~~~

El orden de secciones sigue el de `DESIGN.md`: cabecera, descripción, contexto oculto, transcripción, preguntas esperadas, innecesarias, diseño del candidato, referencia, evaluación y consejos (estos últimos repartidos en las secciones 9 y 10).
