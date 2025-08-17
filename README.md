# PCCF

Proyectos Curriculares de la Familía de Informática del IES La Sénia - Paiporta.

En este Repositorio podrás encontrar las fuentes en formato Markdown de los diferentes
Proyectos Curriculares de la Familia de Informática, así como la posibilidad de generar
las diferentes hojas de cálculo de las Programaciones Didácticas de los Módulos
a partir de los contenidos del BOE que se leen desde diferentes JSON.


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

---
## Filosofía

[![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://fsfe.org/)

---

## Proyectos Curriculares de Ciclos Formativos

Los Proyectos Curriculares (PCCF), se construyen usando varios niveles de construcción, la parte común a todos
los PCCFs se obtienen a partir de los ficheros que provienen de `/src/`, 

---

## Programaciones Didácticas

---

## Descripción de las utilidades

En la carpeta ~/tools~ podemos encontrar una serie de utilidades que se ha desarrollado para la generación de los diferentes
Markdowns y las hojas de cálculo.

También hay pequeñas utilidades (`tricky-tools`) que se han utilizado para ir construyendo los diferentes JSON que definen los
datos de los Ciclos Formativos.

## Construyendo Proyectos en Local

Usando `Makefile` se han preparado una serie de reglas para faciliar la *compilación* a PDF de los diferentes Proyectos
Curriculares de Ciclo Formativo.

Este `Makefile` se utiliza también por parte de las Acciones de GitHub para la **Construcción Automática** de los diferentes proyectos cuando se hacen contribuciones.

Algunos de los `targets` disponibles están listados a continuación, con el propósito de generar los PDFs y las diferentes
hojas de cálculo.

No todos los `targets` tienen las mismas opciones y estan en construcción, así que se no se espera que tengan los mismos
mensajes de salida, ni el mismo formato (colores) ^_^.

### Usage de los targets

Se muestran algunos usages de `targets` a modo de ejemplo, pero lo mejor siempre : *Use the source, Luke!*:

```shell
# Crea el PDF de PCCF de SMX y lo abre mediante xdg-open.
make local-proyecto-smx
# Lo mismo para ASIR, DAM y DAW
make local-proyecto-asir
make local-proyecto-dam
make local-proyecto-daw

# Crea la hoja de calculo para DAW
make local-excel-daw
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

sudo apt install python3-jinja2 \
		 python3-box
		 
```

