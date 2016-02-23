#!/usr/bin/env bash

source $HOME/haskell/ghc/envvars.sh

"${BIN_PREFIX}gcc" $CFLAGS -nostdlib $HOME/haskell/ghc/crt0.o "$@"
