#!/usr/bin/env python3

import json
from box import Box
# Importamos Jinja2
import jinja2

# Cargar el JSON desde un archivo

with open('./boe/rd-daw.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Convertir el diccionario a un objeto Box
data_box = Box(data)

for codigo in data_box.ModulosProfesionales:

    modulo=data_box.ModulosProfesionales[codigo]
    contexto=modulo.horas
    UnidadesCompetenciaAcreditadas=modulo.UnidadesCompetenciaAcreditadas

    modulonombre=modulo.nombre

    templateLoader = jinja2.FileSystemLoader(searchpath="./templates/")
    templateEnv = jinja2.Environment(loader=templateLoader)
    TEMPLATE_FILE = "PCCF_500_PlantillaPD_MODULO_DAW.md"
    template = templateEnv.get_template(TEMPLATE_FILE)
    outputText = template.render(modulo=modulo)  # this is where to put args to the template renderer

    print(outputText)






    '''
    print(" * Trabajando con "+modulo.nombre)
    for ra in modulo.ResultadosAprendizaje:
        print("El Resultado de Aprendizaje "+ra+":")
        ra_aux = modulo.ResultadosAprendizaje[ra]
        for criterio in ra_aux:
            if criterio == "CriteriosEvaluacion":
                for ce in ra_aux[criterio]:
                    print(" - "+ce+")"+ra_aux[criterio][ce])
            else:
                print(criterio)
        print("-----")
    '''


