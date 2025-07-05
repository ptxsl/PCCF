#!/usr/bin/env python3

import json
from box import Box

# Cargar el JSON desde un archivo
print(" Json RAptor - El analizador de RAs")
with open('./boe/rd-daw.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Convertir el diccionario a un objeto Box
data_box = Box(data)

for codigo in data_box.ModulosProfesionales:
    modulo=data_box.ModulosProfesionales[codigo]
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


