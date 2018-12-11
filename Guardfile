# Auto-update HTML when adoc changes
require 'asciidoctor'
guard :shell do
  watch(/^.*\.adoc$/) {|m|
    m[0]
    Asciidoctor.convert_file(m[0])
  }
end
