#!/bin/sh
PROTON=$1
rsync -arv --delete $PROTON/proton-c/docs/api/html/ proton-c
rsync -arv --delete $PROTON/proton-c/bindings/cpp/docs/html/ proton-cpp
