# Variables
CONFIG_DIR = $(HOME)/.config
BACKUP_DIR = $(HOME)/.backup
NVIM_CONFIG_DIR = $(CONFIG_DIR)/nvim

FORCE :=

.PHONY: default all terminal nvim nvim-restore .nvim-clear .nvim-backup .nvim-backup-not-exist

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

.nvim-backup: $(BACKUP_DIR) .nvim-backup-not-exist
	@if [ -d $(NVIM_CONFIG_DIR) ]; then \
		echo "Found existing Neovim config. Creating backup..."; \
		mv $(NVIM_CONFIG_DIR) "$(BACKUP_DIR)/nvim.bak"; \
	fi

.nvim-backup-not-exist:
	@if [ -d $(BACKUP_DIR)/nvim.bak ]; then \
		if [ -z "$(FORCE)" ]; then \
			echo "Found existing backup. If you want to rewrite it, run 'make nvim FORCE=true'"; \
			exit 1; \
		else \
			echo "FORCE flag detected. Overwriting existing backup..."; \
		fi; \
	fi

.nvim-clear:
	@if [ -d $(NVIM_CONFIG_DIR) ]; then \
		rm -rf $(NVIM_CONFIG_DIR); \
	fi

