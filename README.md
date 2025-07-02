# PCCF

Proyectos Curriculares de la Familía de Informática del IES La Sénia - Paiporta.

## Ciclos Formativos

| Siglas | Nombre Completo | Nivel |
|--------|-----------------|-------|
| SMX    | Sistemas Microinformáticos y Redes | Grado Medio |
| DAW 	 | Desarrollo de Aplicaciones Web | Grado Superior |
| DAM    | Desarrollo de Aplicaciones Multiplataforma | Grado Superior |
| ASIR   | Admnistración de Sistemas Informáticos y Redes | Grado Superior |

## Entorno y Desarrollo

Se recomienda usar `emacs`, un editor de texto para toda una vida o `vim` y trabajar desde
Sistemas Operativos que promuevan el Software Libre y Abierto, como Ubuntu o Debian.

[![Emacs](https://img.shields.io/badge/Emacs-%237F5AB6.svg?&logo=gnu-emacs&logoColor=white)](https://www.gnu.org/software/emacs/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?logo=ubuntu&logoColor=white)](#)

## Herramientas

[![made-with-Markdown](https://img.shields.io/badge/Made%20with-Markdown-1f425f.svg)](http://commonmark.org)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnubash&logoColor=fff)](#)
[![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=fff)](#)
[![Haskell](https://img.shields.io/badge/Haskell-3776AB?logo=haskell&logoColor=fff)](#)

## Filosofía

[![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://fsfe.org/)

---
## Construyendo Proyectos en Local

Usando `Makefile` se han preparado una serie de reglas para faciliar la *compilación* a PDF de los diferentes Proyectos
Curriculares de Ciclo Formativo.

Este `Makefile` se utiliza también por parte de las Acciones de GitHub para la **Construcción Automática** de los diferentes proyectos cuando se hacen contribuciones.

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

Estas dependencias también están definidas en el Makefile para ser instalados dentro del entorno
de ~chroot~ de las GitHub Actions.

```shell
sudo apt install make pandoc \
	     texlive-extra-utils \
		 texlive-lang-spanish \
		 texlive-latex-extra \
		 texlive-fonts-extra

```

