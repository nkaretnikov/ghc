#!/usr/bin/env bash

set -e

source $HOME/haskell/ghc/envvars.sh

SRCS="dlfcn iconv mman poll signal sys/select termios time times unistd"
for SRC in $SRCS; do
  x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/$SRC.o" "${LIBSHIMSRC}/$SRC.c"
  x86_64-elf-ar cr "${LIBSHIMLIB}/libshim.a" "${LIBSHIMOBJ}/$SRC.o"
done

./configure \
  CPP="${BIN_PREFIX}gcc -E" \
  --verbose \
  --target=$TARGET \
  --prefix=$PREFIX \
  --with-gcc="/home/nikita/haskell/ghc/gcc.sh" \
  --with-ld="/home/nikita/haskell/ghc/ld.sh" \
  --with-nm="${BIN_PREFIX}nm" \
  --with-ar="${BIN_PREFIX}ar" \
  --with-ranlib="${BIN_PREFIX}ranlib" \
  --with-objdump="${BIN_PREFIX}objdump"
