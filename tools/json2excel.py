#!/usr/bin/env python3

import sys
import json
import os
import shutil
from box import Box
import pandas as pd
import numpy as np
import openpyxl
from openpyxl.styles import Alignment

# Importamos Jinja2
import jinja2

# Cargar el JSON desde un archivo

if sys.argv[1] == "DAW":

    with open('./boe/rd-daw.json', 'r', encoding='utf-8') as f:
        data = json.load(f)

data_box = Box(data)

# Abrimos el excel
#writer = pd.ExcelWriter("datos.xlsx", engine="openpyxl")

libro=str(sys.argv[1])+"_libro.xlsx"
wb = openpyxl.Workbook()

# Algunas posiciones fijas
p_codigo='B1'
p_nombre='B2'
p_ra_col_l='B'
p_ra_titulo_col=2
p_ra_titulo_row=8

for codigo in data_box.ModulosProfesionales:

    modulo=data_box.ModulosProfesionales[codigo]
    print(modulo.nombre)

    ws = wb.create_sheet(title=modulo.nombre)
    ws['A1'].value="Codigo"
    ws['A2'].value="Nombre"
    ws[p_codigo].value=codigo
    ws[p_nombre].value=modulo.nombre


    print(" - RA ")
    ws.merge_cells(start_row=p_ra_titulo_row, start_column=p_ra_titulo_col, end_row=p_ra_titulo_row+1, end_column=p_ra_titulo_col)
    ws.cell(column=p_ra_titulo_col,row=p_ra_titulo_row).value="RESULTADO DE APRENDIZAJE"
    ws.cell(column=p_ra_titulo_col,row=p_ra_titulo_row).alignment = Alignment(horizontal='center', vertical='center')
    ws.column_dimensions[p_ra_col_l].width = 40

    # Ahora ya seguimos para abajo
    p_ra_titulo_row=p_ra_titulo_row+2

    for ra in modulo.ResultadosAprendizaje:
        listaCriterios=modulo.ResultadosAprendizaje[ra].CriteriosEvaluacion
        numCriterios=len(listaCriterios)
        print(" -- Criterios del RA "+str(len(listaCriterios)))
        print(listaCriterios)
        ws.cell(column=p_ra_titulo_col,row=p_ra_titulo_row).value=modulo.ResultadosAprendizaje[ra].Resultado
        ws.cell(column=p_ra_titulo_col,row=p_ra_titulo_row).alignment = Alignment(horizontal='center', vertical='center')
        ws.merge_cells(start_row=p_ra_titulo_row, start_column=p_ra_titulo_col, end_row=p_ra_titulo_row+numCriterios+1, end_column=p_ra_titulo_col)




        # Incrementamos la fila
        p_ra_titulo_row=p_ra_titulo_row+numCriterios+1


wb.save(libro)

