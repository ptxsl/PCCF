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
        data = json.load(f)

elif sys.argv[1] == "DAM":

    with open('./boe/rd-dam.json', 'r', encoding='utf-8') as f:
        data = json.load(f)

elif sys.argv[1] == "SMX":

    with open('./boe/rd-smx.json', 'r', encoding='utf-8') as f:
        data = json.load(f)

elif sys.argv[1] == "ASIR":

    with open('./boe/rd-asir.json', 'r', encoding='utf-8') as f:
        data = json.load(f)

else:
    print(" * No se ha indicado Ciclo ")
    sys.exit(0)

# Convertir el diccionario a un objeto Box
data_box = Box(data)

for codigo in data_box.ModulosProfesionales:


    modulo=data_box.ModulosProfesionales[codigo]

    modulo.CPSS=data_box.CompetenciasProfesionalesPersonalesSociales
    modulo.OG=data_box.ObjetivosGenerales

    fmod = "./temp/PD_"+str(codigo)+"_"+modulo.nombre.replace(" ","")+".md"

    if os.path.exists(fmod):
        print(" Fichero ya presente: , nada que hacer.")
        print(" Se utilizara el ya subido de "+modulo.nombre.replace(" ",""))
        print("")

    else:
        print(" Generando Programacion Didactica para "+modulo.nombre.replace(" ",""))
        templateLoader = jinja2.FileSystemLoader(searchpath="./templates/")
        templateEnv = jinja2.Environment(loader=templateLoader)
        TEMPLATE_FILE = "PCCF_PD_Plantilla_MODULO_"+sys.argv[1]+".md"
        template = templateEnv.get_template(TEMPLATE_FILE)
        outputText = template.render(modulo=modulo)
        fmod = "./temp/PD_"+str(codigo)+"_"+modulo.nombre.replace(" ","")+".md"

        # Quitamos las Tildes graficas
        # Fixes : #2

        fmod = fmod.replace('á','a').replace('é','e').replace('í','i').replace('ó','o').replace('ú','u')

        fmodulo = open(fmod,"w")
        fmodulo.write(outputText)
        fmodulo.close()

    print(" - Includes from PCCF para "+modulo.nombre.replace(" ",""))

    with open(fmod, "rt") as fin:
         with open("./temp/out.txt", "wt") as fout:
            for line in fin:
                if "@@@" in line:
                    pccff="".join(line.split('@')[3]).rstrip()
                    print("   - [@@@] : "+"".join(line.split('@')[3]).rstrip())

                    if os.path.exists("./temp/"+pccff):
                        newpages=0
                        with open("./temp/"+pccff, "rt") as fincluded:
                            for linein in fincluded:
                                ignorar=False
                                if linein.startswith('\\newpage') and newpages < 10:
                                    print("   - [!] Ignorando saltos de pagina en las 10 primeras lineas")
                                    ignorar=True

                                if linein.startswith('# '):
                                    print("   - [!] Ignorando H1 "+linein)
                                    ignorar=True

                                if linein.startswith('#'):
                                    linein='#'+linein

                                if not ignorar :
                                    fout.write(linein)

                                newpages=newpages+1
                    else:
                        print(" File not exists, not included : ./temp/"+pccff)
                else:
                    fout.write(line)
            fout.close()
    shutil.move("./temp/out.txt", fmod)

sys.exit(0)
