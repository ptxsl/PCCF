#!/usr/bin/env python3

import sys
import json
import os
import shutil
from box import Box
# Importamos Jinja2
import jinja2

# Cargar el JSON desde un archivo

if sys.argv[1] == "DAW":

    with open('./boe/rd-daw.json', 'r', encoding='utf-8') as f:
        data1 = json.load(f)

if sys.argv[1] == "DAM":

    with open('./boe/rd-dam.json', 'r', encoding='utf-8') as f:
        data1 = json.load(f)

if sys.argv[2] == "DAM":

    with open('./boe/rd-dam.json', 'r', encoding='utf-8') as h:
        data2 = json.load(h)

if sys.argv[2] == "ASIR":
    with open('./boe/rd-asir.json', 'r', encoding='utf-8') as h:
        data2 = json.load(h)

# Convertir el diccionario a un objeto Box
data_box1 = Box(data1)
data_box2 = Box(data2)

for cod_orig in data_box1.ModulosProfesionales:

    modulo_orig = data_box1.ModulosProfesionales[cod_orig]

    for cod_dest in data_box2.ModulosProfesionales:

        modulo_dest = data_box2.ModulosProfesionales[cod_dest]

        if modulo_dest.nombre == modulo_orig.nombre:

            print("Modulo comun["+cod_dest+"]: "+modulo_dest.nombre)
            if modulo_orig.horas == modulo_dest.horas :
                print(" - Horas OK :"+modulo_orig.horas+" -- "+modulo_dest.horas)
            else:
                print(" - Horas MAL :"+modulo_orig.horas+" -- "+modulo_dest.horas)





