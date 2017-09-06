#!/bin/sh
rsync -arv --delete ./proton-c/docs/api/html/ $HOME/alanconway.github.io/proton-c
rsync -arv --delete ./proton-c/bindings/cpp/docs/html/ $HOME/alanconway.github.io/proton-cpp
