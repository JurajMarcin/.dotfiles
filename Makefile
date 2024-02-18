.PHONY: ALL WORKSTATION SERVER CLEAN

ALL WORKSTATION SERVER CLEAN:
	@for subdir in $(wildcard ./configs/*); do \
		$(MAKE) -C $$subdir $@ || exit 1; \
	done
