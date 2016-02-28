#!/usr/bin/env bash

set -e

source $HOME/haskell/ghc/envvars.sh

"${BIN_PREFIX}gcc" $CFLAGS $LDFLAGS \
  $GHC_DIR/efi_main.c "$@" \
  $LIBS \
  -Xlinker --defsym=_DYNAMIC=0
