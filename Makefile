#!/usr/bin/make -f

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

dependences:
	@echo " [${BLUE} * Dependencias necesarias ${RESET}] "
	sudo apt install make pandoc texlive-extra-utils texlive-lang-spanish texlive-latex-extra texlive-fonts-extra

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

	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_SMX.pdf ./PCCF_*.md

	@echo " * Recuerda borrar el directorio o ejecuta el objetivo files"

	#@echo " * Copiando "
	#@cp $(PDF_PATH)/PCCF_SENIA_SMX.pdf pdfs/PCCF_SENIA_SMX.pdf

ver-smx : proyecto-smx

	xdg-open $(PDF_PATH)/PCCF_SENIA_SMX.pdf

proyecto-asir: files proyecto-base

	@echo " [ ${BLUE} Proyecto Curricular : ASIR ${RESET}]"
	@echo " ${LIGHTBLUE} Poblando desde ASIR ${RESET}"

	cp -r src_ASIR/* temp/

	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_ASIR.pdf ./PCCF_*.md

	xdg-open $(PDF_PATH)/PCCF_SENIA_ASIR.pdf

	@echo " * Recuerda borrar el directorio o ejecuta el objetivo files"

proyecto-daw: files proyecto-base

	@echo " [ ${BLUE} Proyecto Curricular : DAW ${RESET}]"
	@echo " ${LIGHTBLUE} Poblando desde DAW ${RESET}"

	cp -r src_DAW/* temp/

	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_DAW.pdf ./PCCF_*.md

	xdg-open $(PDF_PATH)/PCCF_SENIA_DAW.pdf

	@echo " * Recuerda borrar el directorio o ejecuta el objetivo files"

proyecto-dam: files proyecto-base

	@echo " [ ${BLUE} Proyecto Curricular : DAM ${RESET}]"
	@echo " ${LIGHTBLUE} Poblando desde DAM ${RESET}"

	cp -r src_DAM/* temp/

	@cd temp/ && pandoc --template $(TEMPLATE_TEX_PD) $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_DAM.pdf ./PCCF_*.md
	@cd temp/ && pandoc $(PANDOC_OPTIONS) -o $(PDF_PATH)/PCCF_SENIA_DAM_VIRGEN.pdf ./PCCF_*.md
	xdg-open $(PDF_PATH)/PCCF_SENIA_DAM.pdf

	@echo " * Recuerda borrar el directorio o ejecuta el objetivo files"
