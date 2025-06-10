.PHONY: all install clean

SUBDIRS := forgewatch template

all:
	@echo "Use 'make install' to install the full DevPipe system."

install:
	@echo "Installing DevPipe system..."
	@for dir in $(SUBDIRS); do \
		if [ -f $$dir/makefile ] || [ -f $$dir/Makefile ]; then \
			echo "Installing $$dir..."; \
			$(MAKE) -C $$dir install; \
		else \
			echo "Skipping $$dir, no makefile found."; \
		fi \
	done
	@echo "Install complete."

clean:
	@for dir in $(SUBDIRS); do \
		if [ -f $$dir/makefile ] || [ -f $$dir/Makefile ]; then \
			$(MAKE) -C $$dir clean; \
		fi \
	done
	@echo "Clean complete."
