ADOC := $(shell find . -name '*.adoc')
HTML := $(patsubst %.adoc,%.html,$(ADOC))

all: $(HTML)

clean:
	rm -f $(HTML)

%.html: %.adoc
	asciidoctor -a sectanchors -o $@ $<

.PHONY: force


PKGS := github.com/cloudevents/sdk-go/pkg/binding
URLS := $(patsubst %,http://localhost:6060/pkg/%/,$(PKGS))
godoc: all FORCE
	wget -v --no-host-directories -e robots=off --recursive --level=5 --convert-links --no-parent --page-requisites --directory-prefix godoc $(URLS)
	xdg-open file://./github.com/cloudevents/sdk-go/pkg/binding/index.html


FORCE:
.PHONY: FORCE

