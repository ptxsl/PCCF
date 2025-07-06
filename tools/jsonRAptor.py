#!/usr/bin/env python3

import sys
import json
from box import Box
# Importamos Jinja2
import jinja2

# Cargar el JSON desde un archivo

with open('./boe/rd-daw.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Convertir el diccionario a un objeto Box
data_box = Box(data)

inicio=501

for codigo in data_box.ModulosProfesionales:

    modulo=data_box.ModulosProfesionales[codigo]
    templateLoader = jinja2.FileSystemLoader(searchpath="./templates/")
    templateEnv = jinja2.Environment(loader=templateLoader)
    TEMPLATE_FILE = "PCCF_500_PlantillaPD_MODULO_DAW.md"
    template = templateEnv.get_template(TEMPLATE_FILE)
    outputText = template.render(modulo=modulo)
    fmod = "./temp/PCCF_"+str(inicio)+"_PD_"+modulo.nombre.replace(" ","")+".md"
    fmodulo = open(fmod,"w")
    fmodulo.write(outputText)
    fmodulo.close()
    inicio  = inicio + 1

sys.exit(0)
