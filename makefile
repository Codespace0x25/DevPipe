.PHONY: all help install clean update install-forgewatch install-template

SUBDIRS := forgewatch template

# Color codes
RESET  := \033[0m
BOLD   := \033[1m
GREEN  := \033[32m
BLUE   := \033[34m
YELLOW := \033[33m
RED    := \033[31m
CYAN   := \033[36m
MAGENTA := \033[35m

all:
	@echo -e "$(CYAN)➤$(RESET) Use '$(BOLD)make install$(RESET)' to install the full DevPipe system."

help:
	@echo -e "$(BOLD)╭───────────────[ DevPipe Help ]──────────────╮$(RESET)"
	@echo -e "$(BOLD)│$(RESET)  $(GREEN)install$(RESET)            → Install all packages"
	@echo -e "$(BOLD)│$(RESET)  $(GREEN)clean$(RESET)              → Remove build artifacts"
	@echo -e "$(BOLD)│$(RESET)  $(GREEN)update$(RESET)             → Pull updates from submodules"
	@echo -e "$(BOLD)│$(RESET)  $(GREEN)install-forgewatch$(RESET) → Install only the 'forgewatch' module"
	@echo -e "$(BOLD)│$(RESET)  $(GREEN)install-template$(RESET)  → Install only the 'template' module"
	@echo -e "$(BOLD)╰────────────────────────────────────────────╯$(RESET)"

install:
	@echo -e "$(CYAN)▶ Installing DevPipe system...$(RESET)"
	@for dir in $(SUBDIRS); do \
		if [ -f $$dir/Makefile ] || [ -f $$dir/makefile ]; then \
			echo -e "$(BLUE)→ Installing $$dir...$(RESET)"; \
			$(MAKE) -C $$dir install; \
		else \
			echo -e "$(YELLOW)⚠ Skipping $$dir, no makefile found.$(RESET)"; \
		fi; \
	done
	@echo -e "$(GREEN)✔ Install complete.$(RESET)"

install-forgewatch:
	@echo -e "$(MAGENTA)▶ Installing forgewatch...$(RESET)"
	@$(MAKE) -C forgewatch install
	@echo -e "$(GREEN)✔ forgewatch install complete.$(RESET)"

install-template:
	@echo -e "$(MAGENTA)▶ Installing template...$(RESET)"
	@$(MAKE) -C template install
	@echo -e "$(GREEN)✔ template install complete.$(RESET)"

clean:
	@echo -e "$(RED)✖ Cleaning all subprojects...$(RESET)"
	@for dir in $(SUBDIRS); do \
		if [ -f $$dir/Makefile ] || [ -f $$dir/makefile ]; then \
			echo -e "$(RED)→ Cleaning $$dir...$(RESET)"; \
			$(MAKE) -C $$dir clean; \
		fi; \
	done
	@echo -e "$(GREEN)✔ Clean complete.$(RESET)"

update:
	@echo -e "$(CYAN)⟳ Updating subprojects in DevPipe...$(RESET)"
	@for dir in $(SUBDIRS); do \
		if [ -d $$dir ]; then \
			echo -e "$(BLUE)→ Updating $$dir...$(RESET)"; \
			(cd $$dir && git pull); \
		else \
			echo -e "$(YELLOW)⚠ Skipping $$dir, directory not found.$(RESET)"; \
		fi; \
	done
	@echo -e "$(GREEN)✔ Update complete.$(RESET)"
	@echo -e "$(BOLD)‼️  Don't forget to run 'make install' again!$(RESET)"
