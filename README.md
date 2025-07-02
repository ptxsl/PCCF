# PCCF

Proyectos Curriculares de Ciclo Formativo - Familía de Informática del IES La Senia

## Entorno y Desarrollo

[![Emacs](https://img.shields.io/badge/Emacs-%237F5AB6.svg?&logo=gnu-emacs&logoColor=white)](#)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?logo=ubuntu&logoColor=white)](#)

## Herramientas

[![made-with-Markdown](https://img.shields.io/badge/Made%20with-Markdown-1f425f.svg)](http://commonmark.org)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnubash&logoColor=fff)](#)
[![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=fff)](#)

## Filosofía

[![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://github.com/Naereen/badges/)

---
## Construyendo Proyectos

Usando `Makefile` se han preparado una serie de reglas para faciliar la *compilación* a PDF de los diferentes Proyectos
Curriculares de Ciclo Formativo.

### SMX
```shell
make proyecto-smx
```

### ASIR
```shell
make proyecto-asir
```

### DAM
```shell
make proyecto-dam
```
### DAW
```shell
make proyecto-daw
```

## Dependencias

Para instalar las dependencias necesarias, se adjunta una serie de comandos par su ejecución en sistemas basados en Debian.

```shell
sudo apt install make pandoc \
	     texlive-extra-utils \
		 texlive-lang-spanish \
		 texlive-latex-extra \
		 texlive-fonts-extra

```

