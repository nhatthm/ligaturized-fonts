CONFIG_DIR ?= "config"
FONTS_DIR ?= "fonts"
METADATA_DIR ?= "metadata"
OUTPUT_DIR ?= "out"
TEMPLATES_DIR ?= "templates"

FONTS := $(shell ls -1 "$(CONFIG_DIR)"/*.json | tr '/' '.' | cut -d '.' -f 2)

installFontCommands := $(addprefix fonts/,$(FONTS))
ligaturizeFontCommands := $(addprefix ligaturize-font-,$(FONTS))

.PHONY: list-enabled-fonts
list-enabled-fonts:
	@jq -r '. | select(.ligaturize.enabled // false) | .id' "$(CONFIG_DIR)"/*.json

.PHONY: $(installFontCommands)
$(installFontCommands):
	$(eval FONT := "$(subst fonts/,,$@)")

	@rm -rf "$(FONTS_DIR)" || true
	@echo "Installing font: $(FONT)"
	@./resources/scripts/install_font "$(CONFIG_DIR)/$(FONT).json" "$(FONTS_DIR)"

.PHONY: $(ligaturizeFontCommands)
$(ligaturizeFontCommands):
	$(eval FONT := "$(subst ligaturize-font-,,$@)")

	@echo "Ligaturizing font: $(FONT)"
	@./resources/scripts/ligaturize_font "$(CONFIG_DIR)/$(FONT).json" "$(FONTS_DIR)" "$(METADATA_DIR)" "$(OUTPUT_DIR)"

.PHONY: $(GITHUB_ENV)
$(GITHUB_ENV):
	@echo "CONFIG_DIR=$(CONFIG_DIR)" >> $@
	@echo "FONTS_DIR=$(FONTS_DIR)" >> $@
	@echo "METADATA_DIR=$(METADATA_DIR)" >> $@
	@echo "TEMPLATES_DIR=$(TEMPLATES_DIR)" >> $@

.PHONY: $(GITHUB_OUTPUT)
$(GITHUB_OUTPUT):
	@echo "CONFIG_DIR=$(CONFIG_DIR)" >> $@
	@echo "FONTS_DIR=$(FONTS_DIR)" >> $@
	@echo "METADATA_DIR=$(METADATA_DIR)" >> $@
	@echo "TEMPLATES_DIR=$(TEMPLATES_DIR)" >> $@
