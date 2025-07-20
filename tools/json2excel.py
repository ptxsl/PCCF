#!/usr/bin/env python3

import sys
import json
import os
import shutil
from box import Box
import pandas as pd
import numpy as np
import openpyxl
# Importamos Jinja2
import jinja2

# Cargar el JSON desde un archivo

if sys.argv[1] == "DAW":

    with open('./boe/rd-daw.json', 'r', encoding='utf-8') as f:
        data = json.load(f)

data_box = Box(data)

for codigo in data_box.ModulosProfesionales:

    modulo=data_box.ModulosProfesionales[codigo]
    print(modulo)

    # Convertimos los objetos Box a DataFrames
    df = pd.DataFrame(modulo.ResultadosAprendizaje)

    with pd.ExcelWriter("datos.xlsx", engine="openpyxl") as writer:
        df.to_excel(writer, sheet_name=modulo.nombre, index=False)
