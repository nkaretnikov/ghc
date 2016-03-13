#!/usr/bin/env bash

set -e

source $HOME/haskell/ghc/envvars.sh

x86_64-elf-gcc $CFLAGS -c -o "${LIBSTUBOBJ}/iconv.o" "${LIBSTUBSRC}/iconv.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSTUBOBJ}/poll.o" "${LIBSTUBSRC}/poll.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSTUBOBJ}/times.o" "${LIBSTUBSRC}/times.c"
x86_64-elf-ar cr "${LIBSTUBLIB}/libstub.a" "${LIBSTUBOBJ}/iconv.o" "${LIBSTUBOBJ}/poll.o" "${LIBSTUBOBJ}/times.o"

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
