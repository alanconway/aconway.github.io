all: index.html

index.html: index.adoc
	asciidoc $<

