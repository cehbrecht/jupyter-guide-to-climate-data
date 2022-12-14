# Configuration
APP_ROOT := $(abspath $(lastword $(MAKEFILE_LIST))/..)
APP_NAME := rook


.DEFAULT_GOAL := help

.PHONY: all
all: help

.PHONY: help
help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  help              to print this help message. (Default)"
	@echo "  build             to build book."
	@echo "  clean             to remove all files generated by build."
	@echo "  publish           to publish pages to github-pages."

## Build targets

.PHONY: build
build:
	@echo "build..."
	@-jupyter book build . 

.PHONY: clean
clean:
	@echo "Removing build artifacts ..."
	@-rm -fr _build/

.PHONY: publish
publish:
	@echo "Publish to GitHub pages ..."
	@-ghp-import -n -p -f _build/html
	
