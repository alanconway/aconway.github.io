all: pages

pages: index.html cloudevents.html

proton: proton-ruby proton-c proton-cpp

%.html: %.adoc
	asciidoctor $<

SRC = ~/proton
BLD = ~/proton/bld-doc

adoc_html := $(patsubst %.adoc,%.html,$(wildcard *.adoc))

all: adoc

clean:
	rm $(adoc_html)

proton: proton-ruby proton-c proton-cpp

adoc: $(adoc_html)

%.html: %.adoc
	asciidoctor -a sectanchors $<

$(BLD):
	mkdir $(BLD) && cd $(BLD) && my-cmake

proton-%: $(BLD) force
	( cd $(BLD) && make docs-$*; )
	mkdir -p proton-$*
	rsync -ar $(dir $(shell find $(BLD)/$*/doc* -name index.html)) $(PWD)/proton-$*/
	touch $@

force::
