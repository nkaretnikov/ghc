#!/usr/bin/env bash

set -e

source envvars.sh

./configure \
  CPP="${BIN_PREFIX}gcc -E" \
  --target=$TARGET \
  --prefix=$PREFIX \
  --with-gcc="/home/nikita/haskell/ghc/gcc.sh" \
  --with-ld="/home/nikita/haskell/ghc/ld.sh" \
  --with-nm="${BIN_PREFIX}nm" \
  --with-ar="${BIN_PREFIX}ar" \
  --with-ranlib="${BIN_PREFIX}ranlib" \
  --with-objdump="${BIN_PREFIX}objdump"
