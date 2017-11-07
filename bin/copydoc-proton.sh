#!/bin/sh
BUILD=$1
test -d $1 || { echo Need build directory; exit 1; }
rsync -arv --delete $BUILD/proton-c/docs/api/html/ proton-c
rsync -arv --delete $BUILD/proton-c/bindings/cpp/docs/html/ proton-cpp
rsync -arv --delete $BUILD/proton-c/bindings/ruby/doc/ proton-ruby
