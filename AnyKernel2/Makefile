NAME ?= Spitfire

VERSION ?= MIUI

DATE := $(shell date +'%Y%m%d-%H%M')

ZIP := $(NAME)-$(VERSION)-$(DATE).zip

placebo := modules/system/lib/modules/placeholder

EXCLUDE := Makefile *.git* $(placebo)

all: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf "$(NAME)-"*.zip*
	@rm -vf Image.gz-dtb
	@echo "Done."
