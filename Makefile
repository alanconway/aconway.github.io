all: index.html proton-ruby proton-c proton-cpp

index.html: index.adoc
	asciidoctor $<

SRC = ~/proton
BLD = ~/proton/bld-doc

$(BLD):
	mkdir $(BLD) && cd $(BLD) && my-cmake

force::

proton-%: $(BLD) force
	( cd $(BLD) && make docs-$*; )
	mkdir -p proton-$*
	rsync -ar $(dir $(shell find $(BLD)/$*/doc* -name index.html)) $(PWD)/proton-$*/
	touch $@
