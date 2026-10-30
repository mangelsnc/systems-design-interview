# Niveles de dificultad

Cada nivel fija el tamaño del caso, cuántas trampas lleva, cómo se comporta el entrevistador con las pistas, cuánto se profundiza tras el diseño y qué nota hace falta para cada veredicto.

Tipos de trampa disponibles para cualquier nivel:

- **Requisito oculto**: algo que el sistema debe cumplir y que solo aparece si se pregunta (por ejemplo, que los mensajes deben poder editarse durante 15 minutos).
- **Restricción heredada**: un sistema legacy que no se puede tocar, un contrato con un proveedor, una base de datos compartida con otro equipo.
- **Dato que invalida la solución obvia**: picos de tráfico 50 veces superiores a la media, residencia de datos obligatoria en la UE, latencia máxima de 100 ms.
- **Ambigüedad**: el enunciado admite dos lecturas y hay que resolverla antes de diseñar.
- **Restricción organizativa o de negocio** (solo Staff): equipo de tres personas, presupuesto cerrado, plazo regulatorio, dos equipos con incentivos opuestos.

Las trampas se documentan en el archivo de trabajo con la pregunta, o preguntas, que las destapan.

## Junior

- **Caso**: sistema acotado, un servicio o pocos, volumen modesto (miles de usuarios, decenas de peticiones por segundo). El candidato debe poder diseñarlo con una API, una base de datos y quizá una caché.
- **Trampas**: 1, evidente si se pregunta lo básico (quién lo usa, qué tiene que hacer).
- **Pistas**: activas. Si el candidato se salta algo importante o se desvía, el entrevistador lo reconduce sin esperar a que lo pida ("antes de elegir la base de datos, ¿no te interesa saber qué volumen de datos vamos a guardar?"). Cada reconducción y cada pista pedida restan 1 punto.
- **Estimación de capacidad**: no se exige; si la hace, suma en Comunicación y proceso.
- **Profundización tras el diseño**: 1 o 2 preguntas sencillas ("¿qué pasa si dos usuarios reservan la misma hora a la vez?").
- **Veredicto**: Strong Hire ≥80, Hire ≥65, Lean Hire ≥50, No Hire <50.
- **Ejemplos**: acortador de URLs para una agencia de marketing; sistema de reservas de una clínica de fisioterapia con tres sedes.

## Mid

- **Caso**: varias piezas que colaboran. Aparecen colas, caché, trabajos en segundo plano y alguna estimación de capacidad. Volumen de cientos de miles a pocos millones de usuarios.
- **Trampas**: 2.
- **Pistas**: solo si el candidato se atasca de verdad (varias intervenciones sin avanzar) o la pide. Cada pista resta 3 puntos.
- **Estimación de capacidad**: esperada en términos gruesos (peticiones por segundo, almacenamiento al año).
- **Profundización tras el diseño**: 1 o 2 preguntas sobre el punto más débil del diseño.
- **Veredicto**: Strong Hire ≥82, Hire ≥70, Lean Hire ≥57, No Hire <57.
- **Ejemplos**: sistema de notificaciones multicanal de una app de banca; feed de actividad de una red social de corredores.

## Senior

- **Caso**: escala real (millones de usuarios activos, miles de peticiones por segundo), alta disponibilidad, decisiones de consistencia frente a disponibilidad, multi-región o picos fuertes.
- **Trampas**: 2 o 3, y al menos una invalida la solución obvia.
- **Pistas**: ninguna proactiva. Si el candidato la pide, se da de forma escueta y resta 5 puntos.
- **Estimación de capacidad**: obligatoria, y debe usarse para justificar decisiones.
- **Profundización tras el diseño**: 2 a 4 preguntas sobre fallos, escalado y consistencia ("¿qué pasa si se cae la cola?", "¿cómo lo escalas al triple?", "¿qué ve el usuario si las dos regiones discrepan?").
- **Veredicto**: Strong Hire ≥85, Hire ≥74, Lean Hire ≥62, No Hire <62.
- **Ejemplos**: venta de entradas para conciertos con salidas masivas; sistema de pagos entre particulares con antifraude en tiempo real.

## Staff/Principal

- **Caso**: problema abierto con restricciones de negocio y organizativas. El enunciado es vago a propósito y parte de la nota depende de cómo se acota el problema y de qué se decide no hacer.
- **Trampas**: 3 o más, al menos una organizativa o de negocio.
- **Pistas**: ninguna, ni siquiera pedida. El entrevistador responde "En una entrevista real no tendrías esa ayuda. ¿Cómo lo resolverías con lo que sabes?". Cada petición resta 5 puntos.
- **Estimación de capacidad**: obligatoria, junto con una estimación aproximada de coste o de esfuerzo del equipo cuando el caso lo pida.
- **Profundización tras el diseño**: 2 a 4 preguntas que mezclan lo técnico y lo organizativo ("¿cómo lo despliegas sin parar el monolito?", "¿qué equipo es dueño de esta pieza?", "¿qué quitarías si el presupuesto se reduce a la mitad?").
- **Veredicto**: Strong Hire ≥88, Hire ≥78, Lean Hire ≥66, No Hire <66.
- **Ejemplos**: migrar el motor de facturación de una aseguradora desde un monolito con tráfico vivo y auditoría regulatoria; plataforma de datos compartida entre cinco equipos de producto con presupuesto fijo.
