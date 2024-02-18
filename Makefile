.PHONY: ALL WORKSTATION SERVER CLEAN wallpapers

WORKSTATION: wallpapers

ALL WORKSTATION SERVER CLEAN:
	@for subdir in $(wildcard ./configs/*); do \
		$(MAKE) -C $$subdir $@ || exit 1; \
	done

wallpapers:
	./scripts/install wallpapers ~/.local/share/wallpapers
