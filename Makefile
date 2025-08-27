.PHONY: help templates update

help:
	@echo ""
	@echo "Commands: "
	@echo "---------"
	@echo "- templates: pull the whole notebook-template folder"
	@echo "- update   : update the notebook-template folder to latest version"


templates:
	@git submodule update --init --recursive


update:
	@git submodule update --recursive
