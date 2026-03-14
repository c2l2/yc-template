.PHONY: help templates update ai-template-setup ai-template-update

help:
	@echo ""
	@echo "Commands: "
	@echo "---------"
	@echo "- templates: pull the whole templates folder"
	@echo "- update   : update the templates folder to latest version"
	@echo "- ai-template-setup  : add/fetch the research-ai-template remote for future updates"
	@echo "- ai-template-update : pull the latest research-ai-template files into repo root"


templates:
	@git submodule update --init --recursive


update:
	@git submodule update --recursive


ai-template-setup:
	@git remote get-url ai-template >/dev/null 2>&1 || git remote add ai-template https://github.com/c2l2/research-ai-template.git
	@git fetch ai-template


ai-template-update: ai-template-setup
	@git subtree pull --prefix=. ai-template main --squash
