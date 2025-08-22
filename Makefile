#!/usr/bin/make -f

# Version 0.3 desde la beta
# Probando si esto funciona.
# A ver ahora

#TEMPLATE_TEX_PD="rsrc/templates/pd-nologo-tpl.latex"
# Colors
BLUE= \e[1;34m
LIGHTBLUE= \e[94m
LIGHTGREEN= \e[92m
LIGHTYELLOW= \e[93m

RESET= \e[0m

# Templates 
TEMPLATE_TEX_PD="../rsrc/templates/eisvogel.latex"
PANDOC_OPTIONS="-V fontsize=12pt -V mainfont="../rsrc/sorts-mill-goudy/OFLGoudyStM.otf" --pdf-engine=xelatex "
TEMPLATE_TEX_TASK="../rsrc/templates/eisvogel.latex"

# PDFS
PDF_PATH:=$(shell readlink -f PDFS)



# RULES

todo:
	@echo " [ ${BLUE} * Cosas por hacer ${RESET}]"
	@rgrep "TODO" . | grep -v ".git" | grep -v "./temp/"

dependences:
	@echo " [${BLUE} * Dependencias necesarias para PANDOC ${RESET}] "
	sudo apt update ; sudo apt install --yes make pandoc texlive-extra-utils texlive-lang-spanish texlive-latex-extra texlive-fonts-extra

	@echo " [${BLUE} * Dependencias necesarias para PYTHON ${RESET}] "
	sudo apt update ; sudo apt install --yes make python3-jinja2 python3-box python3-numpy python-openpyxl-doc python-pandas-doc python3-pandas




clean:
	@echo " [${BLUE} * Step : Clean ${RESET}] "
	@echo "${LIGHTBLUE} -- PDFS ${RESET}"
	rm -f PDFS/*.pdf
	rm -f PDFS/*.odt
	rm -rf temp/


files:
	@echo " [${BLUE} * Creando Espacio ${RESET}] "
	@echo "${LIGHTBLUE} * Carpeta [ PDFS ]${RESET}"
	mkdir -p PDFS
	@echo "${LIGHTBLUE} * Carpeta [ temp/ ]${RESET}"
	mkdir -p temp
	@echo "${LIGHTBLUE} * Limpiando [ temp/ ]${RESET}"
	rm -rf temp/*


proyecto-base: files
	@echo " [${BLUE} * Poblando el Proyecto Base ${RESET}"
	cp -r src/* temp/


proyecto-smx: files proyecto-base

	@echo " [ ${BLUE} Proyecto Curricular : SMX ${RESET}]"
	@echo " ${LIGHTBLUE} Poblando desde SMX ${RESET}"

	cp -r src_SMX/* temp/

	@echo " ${LIGHTBLUE} Fuentes de las Programaciones de SMX ${RESET}"
	./tools/json2pccf.py SMX

	@echo " ${LIGHTBLUE} Proyecto de SMX ${RESET}"
	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_SMX.pdf ./PCCF_*.md
	@echo " ${LIGHTBLUE} PDF Generado para SMX ${RESET}"

	@echo " ${LIGHTBLUE} Libro de las Programaciones de SMX ${RESET}"
	./tools/json2excel.py SMX
	@echo " ${LIGHTBLUE} Excel Generado para SMX ${RESET}"

local-proyecto-smx : proyecto-smx

	xdg-open $(PDF_PATH)/PCCF_SENIA_SMX.pdf

programaciones-smx: proyecto-smx

	# Me dejo aqui el --verbose por si quiero apuntar algo mas fino en los errores.
	@echo " ${LIGHTBLUE} Generando $(PDF_PATH)/Programaciones_SENIA_SMX.pdf ${RESET}"
	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/Programaciones_SENIA_SMX.pdf ./PD_*.md
	@echo " ${LIGHTBLUE} Programaciones Generadas para SMX ${RESET}"

local-programaciones-smx : programaciones-smx

	xdg-open $(PDF_PATH)/Programaciones_SENIA_SMX.pdf

local-excel-smx: files

	@echo " [ ${BLUE} Excel : SMX ${RESET}]"
	./tools/json2excel.py SMX
	libreoffice PDFS/SMX_libro.xlsx
proyecto-asir: files proyecto-base

	@echo " [ ${BLUE} Proyecto Curricular : ASIR ${RESET}]"
	@echo " ${LIGHTBLUE} Poblando desde ASIR ${RESET}"
	cp -r src_ASIR/* temp/

	@echo " ${LIGHTBLUE} Construimos los MD de las programaciones ${RESET}"
	./tools/json2pccf.py ASIR

	@echo " ${LIGHTBLUE} Proyecto de ASIR ${RESET}"
	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_ASIR.pdf ./PCCF_*.md
	@echo " ${LIGHTBLUE} PDF Generado para ASIR ${RESET}"

	@echo " ${LIGHTBLUE} Libro de las Programaciones de ASIR ${RESET}"
	./tools/json2excel.py ASIR
	@echo " ${LIGHTBLUE} Excel Generado para ASIR ${RESET}"


local-proyecto-asir: proyecto-asir

	xdg-open $(PDF_PATH)/PCCF_SENIA_ASIR.pdf



local-excel-asir: files

	@echo " [ ${BLUE} Excel : ASIR ${RESET}]"
	./tools/json2excel.py ASIR
	libreoffice PDFS/ASIR_libro.xlsx

programaciones-asir: proyecto-asir

	# Me dejo aqui el --verbose por si quiero apuntar algo mas fino en los errores.
	@echo " ${LIGHTBLUE} Generando $(PDF_PATH)/Programaciones_SENIA_ASIR.pdf ${RESET}"
	@cd temp/ && pandoc  --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/Programaciones_SENIA_ASIR.pdf ./PD_*.md
	@echo " ${LIGHTBLUE} Programaciones Generadas para ASIR ${RESET}"

local-programaciones-asir : programaciones-asir

	xdg-open $(PDF_PATH)/Programaciones_SENIA_ASIR.pdf

proyecto-daw: files proyecto-base

	@echo " [ ${BLUE} Proyecto Curricular : DAW ${RESET}]"
	@echo " ${LIGHTBLUE} Poblando desde DAW ${RESET}"

	cp -r src_DAW/* temp/

	@echo " ${LIGHTBLUE} Programaciones de DAW ${RESET}"
	./tools/json2pccf.py DAW

	@echo " ${LIGHTBLUE} Libro de las Programaciones de DAW ${RESET}"
	./tools/json2excel.py DAW

	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_DAW.pdf ./PCCF_*.md

local-excel-daw: files

	@echo " [ ${BLUE} Excel : DAW ${RESET}]"
	./tools/json2excel.py DAW
	libreoffice PDFS/DAW_libro.xlsx

local-proyecto-daw: proyecto-daw

	xdg-open $(PDF_PATH)/PCCF_SENIA_DAW.pdf

programaciones-daw: proyecto-daw

	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/Programaciones_SENIA_DAW.pdf ./PD_*.md

local-programaciones-daw : programaciones-daw

	xdg-open $(PDF_PATH)/Programaciones_SENIA_DAW.pdf


proyecto-dam: files proyecto-base

	@echo " [ ${BLUE} Proyecto Curricular : DAM ${RESET}]"

	@echo " ${LIGHTBLUE} Poblando desde DAM ${RESET}"
	cp -r src_DAM/* temp/

	@echo " ${LIGHTBLUE} Programaciones de DAM ${RESET}"
	./tools/json2pccf.py DAM

	@echo " ${LIGHTBLUE} Libro de las Programaciones de DAM ${RESET}"
	./tools/json2excel.py DAM
	@echo " ${LIGHTBLUE} Excel Generado para DAM ${RESET}"

	@echo " ${LIGHTBLUE} Generando $(PDF_PATH)/PCCF_SENIA_DAM.pdf ${RESET}"
	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_DAM.pdf ./PCCF_*.md
	@echo " ${LIGHTBLUE} PDF Generado para DAM ${RESET}"

local-proyecto-dam: proyecto-dam

	xdg-open $(PDF_PATH)/PCCF_SENIA_DAM.pdf

programaciones-dam: proyecto-dam

	# Me dejo aqui el --verbose por si quiero apuntar algo mas fino en los errores.
	@echo " ${LIGHTBLUE} Generando $(PDF_PATH)/Programaciones_SENIA_DAM.pdf ${RESET}"
	@cd temp/ && pandoc  --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/Programaciones_SENIA_DAM.pdf ./PD_*.md
	@echo " ${LIGHTBLUE} Programaciones Generadas para DAM ${RESET}"

local-programaciones-dam : programaciones-dam

	xdg-open $(PDF_PATH)/Programaciones_SENIA_DAM.pdf

local-excel-dam: files

	@echo " [ ${BLUE} Excel : DAM ${RESET}]"
	./tools/json2excel.py DAM
	libreoffice PDFS/DAM_libro.xlsx
