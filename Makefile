PY?=
PELICAN?=pelican
PELICANOPTS=

BASEDIR=./src
INPUTDIR=./src/content
OUTPUTDIR=./docs
CONFFILE=./src/pelicanconf.py
PUBLISHCONF=./src/publishconf.py


DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

RELATIVE ?= 0
ifeq ($(RELATIVE), 1)
	PELICANOPTS += --relative-urls
endif

SERVER ?= "0.0.0.0"

PORT ?= 0
ifneq ($(PORT), 0)
	PELICANOPTS += -p $(PORT)
endif


help:
	@echo 'Makefile for a pelican Web site                                           '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make format                         Black-ens all Python code          '
	@echo '   make html                           (re)generate the web site          '
	@echo '   make clean                          remove the generated files         '
	@echo '   make regenerate                     regenerate files upon modification '
	@echo '   make publish                        generate using production settings '
	@echo '   make serve [PORT=8000]              serve site at http://localhost:8000'
	@echo '   make serve-global [SERVER=0.0.0.0]  serve (as root) to $(SERVER):80    '
	@echo '   make devserver [PORT=8000]          serve and regenerate together      '
	@echo '   make devserver-global               regenerate and serve on 0.0.0.0    '
	@echo '                                                                          '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html   '
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                    '
	@echo '                                                                          '

format:
	poetry run isort src
	poetry run black src
	poetry run djlint --reformat src/themes/colloquial/templates/*.html

html:
	poetry run pelican-themes -r colloquial &&\
	poetry run pelican-themes -U src/themes/colloquial &&\
	poetry run pelican ./src/content -o ./docs -s ./src/pelicanconf.py $(PELICANOPTS)

clean:
	[ ! -d "$(OUTPUTDIR)" ] || rm -rf "$(OUTPUTDIR)"

regenerate:
	poetry run pelican -r ./src/content -o ./docs -s ./src/pelicanconf.py $(PELICANOPTS)

serve:
	poetry run pelican -l ./src/content -o ./docs -s ./src/pelicanconf.py $(PELICANOPTS)

serve-global:
	poetry run pelican -l ./src/content -o ./docs -s ./src/pelicanconf.py $(PELICANOPTS) -b $(SERVER)

devserver:
	poetry run pelican -lr ./src/content -o ./docs -s ./src/pelicanconf.py $(PELICANOPTS)

devserver-global:
	poetry run pelican -lr ./src/content -o ./docs -s ./src/pelicanconf.py $(PELICANOPTS) -b 0.0.0.0

publish:
	poetry run pelican ./src/content -o ./docs -s ./src/pelicanconf.py $(PELICANOPTS)


.PHONY: html help clean regenerate serve serve-global devserver publish