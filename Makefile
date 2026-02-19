PREFIX ?= $(HOME)/.local
BIN_DIR = $(PREFIX)/bin
COMPLETION_DIR ?= $(HOME)/.zsh/completions
DATA_DIR = $(HOME)/.qrstash

.PHONY: install uninstall

install:
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(COMPLETION_DIR)
	@mkdir -p $(DATA_DIR)
	@chmod 700 $(DATA_DIR)
	@cp bin/qrstash $(BIN_DIR)/qrstash
	@chmod +x $(BIN_DIR)/qrstash
	@cp completions/_qrstash $(COMPLETION_DIR)/_qrstash
	@echo "qrstash installed to $(BIN_DIR)/qrstash"
	@echo "Completions installed to $(COMPLETION_DIR)/_qrstash"

uninstall:
	@rm -f $(BIN_DIR)/qrstash
	@rm -f $(COMPLETION_DIR)/_qrstash
	@echo "qrstash uninstalled"
	@echo "Note: your data in $(DATA_DIR) was not removed"
