# Variables
CONFIG_DIR = $(HOME)/.config
BACKUP_DIR = $(HOME)/.backup
NVIM_CONFIG_DIR = $(CONFIG_DIR)/nvim

FORCE :=

.PHONY: default all terminal nvim nvim-restore .nvim-backup

default: all

all: terminal nvim

terminal:
	@echo "Install terminal configuration"

nvim: .nvim-backup
	@cp -r "$(CURDIR)/conf/nvim" $(NVIM_CONFIG_DIR)
	@echo "Install nvim configuration"

nvim-restore:
	@if [ -d "$(BACKUP_DIR)/nvim.bak" ]; then \
		make .nvim-clear -s; \
		mv "$(BACKUP_DIR)/nvim.bak" $(NVIM_CONFIG_DIR); \
	else \
		echo "Nvim configuration backup not exist"; \
	fi

$(BACKUP_DIR):
	@mkdir -p $@

.nvim-backup: $(BACKUP_DIR)
	@if [ -d $(NVIM_CONFIG_DIR) ]; then \
		echo "Found existing Neovim config. Creating backup..."; \
		mv $(NVIM_CONFIG_DIR) "$(BACKUP_DIR)/nvim.bak"; \
	fi
