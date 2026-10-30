# Rúbrica de evaluación

Nota sobre 100 puntos, repartida en cinco dimensiones con peso fijo. A la suma se le resta la penalización por pistas.

```
total = descubrimiento + preguntas + diseño + tradeoffs + comunicación − min(penalización por pistas, 15)
```

El total nunca baja de 0. El veredicto sale de los umbrales del nivel en `levels.md`.

## Principio general

El diseño se mide contra los **requisitos del caso**, no contra la solución de referencia literal. Un diseño distinto que cubre los requisitos y está bien justificado puede sacar la nota máxima en Diseño. La solución de referencia sirve para saber qué requisitos importan y para comparar al final.

Un requisito **crítico** que el candidato no descubrió y que su diseño tampoco cubre penaliza dos veces: en Descubrimiento (no preguntó) y en Diseño (lo que propone no funciona para el caso). Son fallos distintos.

## 1. Descubrimiento de requisitos (25)

Mide cuánto del contexto oculto llegó a destapar.

Cálculo base: cada pregunta esperada tiene peso alto (3), medio (2) o bajo (1). Porcentaje cubierto = suma de pesos cubiertos / suma total. Las trampas destapadas cuentan como preguntas de peso alto. Las suposiciones explícitas que el entrevistador confirmó cuentan como cubiertas.

| Tramo | Puntos | Criterio |
|---|---|---|
| Excelente | 22-25 | ≥85 % cubierto y todas las trampas destapadas. |
| Correcto | 15-21 | Del 60 % al <85 % cubierto, y como mucho una trampa sin destapar. |
| Flojo | 7-14 | Del 30 % al <60 % cubierto, o dos o más trampas sin destapar. |
| Ausente | 0-6 | <30 %, o se puso a diseñar casi sin preguntar. |

Si el candidato cumple criterios de tramos distintos (por ejemplo, ≥85 % cubierto pero dos trampas sin destapar), manda el tramo más bajo. Una trampa que además figura como pregunta esperada se cuenta una sola vez.

## 2. Calidad de las preguntas (15)

Mide si las preguntas eran útiles y si seguían un orden con sentido.

| Tramo | Puntos | Criterio |
|---|---|---|
| Excelente | 13-15 | Casi todas esperadas o útiles; empieza por negocio, usuarios y escala antes que tecnología; preguntas concretas que cambian el diseño. |
| Correcto | 9-12 | Mayoría útiles, alguna innecesaria o prematura, orden razonable. |
| Flojo | 4-8 | Muchas innecesarias, vagas ("¿algo más?") o saltos a tecnología antes de entender el problema. |
| Ausente | 0-3 | Las preguntas no ayudan a definir el sistema. |

Ajustes: cada pregunta innecesaria que el candidato no supo defender resta 1 punto dentro de esta dimensión; cada prematura, 0,5. Una pregunta dudosa bien defendida no resta nada.

## 3. Diseño final (30)

| Tramo | Puntos | Criterio |
|---|---|---|
| Excelente | 26-30 | Resuelve el caso, cubre los requisitos críticos y la mayoría de los secundarios, componentes con responsabilidades claras, flujo de datos explicado. |
| Correcto | 18-25 | Funciona para el caso principal, algún hueco en requisitos secundarios o en fallos. |
| Flojo | 9-17 | Falta un requisito crítico, piezas sin justificar o un cuello de botella evidente. |
| Ausente | 0-8 | No hay diseño, o no resuelve el problema planteado. |

Si el candidato se rindió, se evalúa el diseño parcial que hubiera presentado; sin diseño, 0.

## 4. Trade-offs y justificación (15)

| Tramo | Puntos | Criterio |
|---|---|---|
| Excelente | 13-15 | Justifica cada pieza importante, nombra alternativas y qué sacrifica; responde bien en la profundización. |
| Correcto | 9-12 | Justifica las piezas principales; en la profundización acierta en lo esencial. |
| Flojo | 4-8 | Elige tecnologías por costumbre ("porque Kafka es lo que se usa"); se atasca en la profundización. |
| Ausente | 0-3 | Sin justificación. |

## 5. Comunicación y proceso (15)

| Tramo | Puntos | Criterio |
|---|---|---|
| Excelente | 13-15 | Resume los requisitos antes de diseñar, separa funcionales y no funcionales, estima capacidad cuando el nivel lo pide, explica en voz alta, estructura clara. |
| Correcto | 9-12 | Proceso razonable con algún salto; estimación tosca pero presente si hacía falta. |
| Flojo | 4-8 | Desordenado, no resume, no estima cuando el nivel lo exige. |
| Ausente | 0-3 | Imposible seguir su razonamiento. |

## Penalización por pistas

| Nivel | Por pista | Notas |
|---|---|---|
| Junior | −1 | Cuentan también las reconducciones que el entrevistador hace sin que se las pidan. |
| Mid | −3 | Solo pistas pedidas o dadas porque el candidato estaba atascado. |
| Senior | −5 | Solo pistas pedidas. |
| Staff/Principal | −5 | Por cada petición; la pista no se da. |

Tope total de penalización: 15 puntos.

## Rendición

Si el candidato dice "me rindo", o pide ver la solución y confirma que se rinde cuando el entrevistador se lo pregunta, la entrevista termina y se evalúa lo hecho. El veredicto queda en No Hire salvo que el diseño parcial ya justificara otro veredicto según los umbrales; en ese caso se aplica el umbral normal y se indica en la ficha que hubo rendición.

## Consejos finales

La evaluación siempre incluye:

1. Nota total, desglose por dimensión con una o dos frases de justificación cada una, penalizaciones y veredicto.
2. Preguntas esperadas que el candidato no hizo: por qué importaban y qué parte del diseño habrían cambiado.
3. Preguntas innecesarias que hizo: por qué no aportaban.
4. Dos o tres preguntas reales del candidato reformuladas mejor, con el porqué (por ejemplo, "¿usáis AWS?" frente a "¿tenemos alguna restricción de proveedor de nube o de residencia de datos?").
5. Puntos fuertes del diseño y huecos frente a los requisitos.
6. Comparación con la solución de referencia: dónde coincide, dónde diverge y si la divergencia es válida.
7. Tres consejos concretos y accionables para la próxima entrevista.
