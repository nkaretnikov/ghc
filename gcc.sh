#!/usr/bin/env bash

source $HOME/haskell/ghc/envvars.sh

"${BIN_PREFIX}gcc" $CFLAGS -nostdlib crt0.o "$@"
