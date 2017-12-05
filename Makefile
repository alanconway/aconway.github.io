all: index.html proton-ruby
	git add --all

RUBY=~/proton/rubydev/proton-c/bindings/ruby/doc

proton-ruby: index.html $(RUBY)/*
	rsync -arv --delete $(RUBY)/ proton-ruby
	touch proton-ruby

index.html: index.adoc
	asciidoc $<
