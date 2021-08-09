PWD := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
OUT_DIR ?= $(PWD)out
INIT_FILE := $(PWD)init.tex

## HELPERS
.PHONY: help
help:
	@echo Supported targets:
	@cat $(MAKEFILE_LIST) | grep -e "^[\.a-zA-Z0-9_-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-35s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

## TARGETS
.PHONY: build
build: ## run latexmk with xelatex
	latexmk -xelatex -shell-escape -jobname=./out/out -Werror -interaction=nonstopmode $(INIT_FILE)

watch: clean ## run watch script
	./watch.sh

spell_check_bg: ## do bulgarian spell check on the init file only
	aspell -c -l bg -t $(INIT_FILE) && rm $(INIT_FILE).bak

clean: ## clean the output directory
	mkdir -p $(OUT_DIR) && rm -rf $(OUT_DIR)/*