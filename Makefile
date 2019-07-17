ADOC := $(shell find . -name '*.adoc')
HTML := $(patsubst %.adoc,%.html,$(ADOC))

all: $(HTML)

clean:
	rm -f $(HTML)

%.html: %.adoc
	asciidoctor -a sectanchors -o $@ $<

.PHONY: force

godoc: force
	godoc-grab github.com/cloudevents/sdk-go/pkg/cloudevents/transport/x
