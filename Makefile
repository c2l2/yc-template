.PHONY: help templates update ai-template-setup ai-template-update _ai-template-sync-agents

AI_TEMPLATE_SUBMODULE := yc-ai-assistant
AI_TEMPLATE_AGENTS_SRC := $(AI_TEMPLATE_SUBMODULE)/AGENTS.md
AI_TEMPLATE_AGENTS_DST := AGENTS.md

help:
	@echo ""
	@echo "Commands: "
	@echo "---------"
	@echo "- templates         : initialize or refresh the templates submodule"
	@echo "- update            : update the templates submodule to the recorded commit"
	@echo "- ai-template-setup : initialize the yc-ai-assistant submodule and sync root AGENTS.md"
	@echo "- ai-template-update: update the yc-ai-assistant submodule from main and sync root AGENTS.md"


templates:
	@git submodule update --init --recursive templates


update:
	@git submodule update --recursive templates


ai-template-setup:
	@git submodule update --init --recursive $(AI_TEMPLATE_SUBMODULE)
	@$(MAKE) --no-print-directory _ai-template-sync-agents


ai-template-update:
	@git submodule update --init --remote --recursive $(AI_TEMPLATE_SUBMODULE)
	@$(MAKE) --no-print-directory _ai-template-sync-agents


_ai-template-sync-agents:
	@test -f "$(AI_TEMPLATE_AGENTS_SRC)" || { echo "error: missing $(AI_TEMPLATE_AGENTS_SRC)" >&2; exit 1; }
	@cp "$(AI_TEMPLATE_AGENTS_SRC)" "$(AI_TEMPLATE_AGENTS_DST)"
