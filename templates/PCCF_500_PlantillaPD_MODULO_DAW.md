\newpage

# Programación didáctica: Módulo {{ modulo.nombre }}

## Datos identificativos y contextualización del módulo. 

Es un módulo de {{ modulo.horas }} horas que se imparte en el Ciclo de Grado Superior de 
Técnico en Desarrollo de Aplicaciones Web.

Tiene una correspondéncia de Créditos de {{ modulo.creditos}}.

## Relación entre los estándares de competencia y los módulos del ciclo formativo

| Unidad de Competencia | Descripción |
|-----------------------|-------------|{% for uca in modulo.UnidadesCompetenciaAcreditadas %}
| {{ uca }} | {{ modulo.UnidadesCompetenciaAcreditadas[uca] }} |
{% endfor %}

## Resultados de Aprendizaje

Los **Resultados de Aprendizaje** relativos al módulo de {{modulo.nombre}} son:

|Código| Resultado de Aprendizaje |
|------|--------------------------|{% for ra in modulo.ResultadosAprendizaje %}
| {{ ra }} | {{ modulo.ResultadosAprendizaje[ra].Resultado }} |{% endfor %}
|<img width=200/>|<img width=500/>|

## Secuenciación de las Unidades de Programación. 

A RELLENAR POR DOCENTE

Se propone esta tabla

| Número | Título                    | Inicio    | Fin       |
|--------|---------------------------|-----------|-----------|
| 01     | Introducción a vim        | 08/09/2025| 10/10/2025|
| 02     | vim: Hay vida más de :wq! | 11/10/2025| 21/10/2025|
| 03     | vim: Comando .            | 11/10/2025| 21/10/2025|
| 04     | vim: aprendiendo Regex    | 22/10/2025| 20/12/2025|

## Unidades de Programacion

A RELLENAR POR DOCENTE

### Unidad 01 : Introducción
### Unidad 02 : ...

## Metodología del proceso de enseñanza-aprendizaje

Atendiendo al PCCF. En cada SA se especifican.

## Recursos

Atendiendo al PCCF. En cada SA se especifican.

## Uso de espacios y equipamientos. 

A RELLENAR POR DOCENTE

## Medidas de atención a la diversidad. 

A RELLENAR POR DOCENTE

## Evaluación del aprendizaje. 

A RELLENAR POR DOCENTE

## Actividades complementarias y extraescolares. 

A RELLENAR POR DOCENTE

## Criterios y procedimientos para la evaluación del desarrollo de la programación y de la práctica docente. 

Atendiendo al PCCF. En cada SA se especifican.

## Esquema general de {{modulo.nombre}}

