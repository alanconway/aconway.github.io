# Auto-update HTML when adoc changes
require 'asciidoctor'
guard :shell do
  watch(/^.*\.adoc$/) {|m|
    Asciidoctor.convert_file m[0], :attributes => { "sectanchors" => true }
  }
end
