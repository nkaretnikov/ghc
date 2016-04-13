#!/usr/bin/env bash

set -e

source $HOME/haskell/ghc/envvars.sh

x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/dlfcn.o" "${LIBSHIMSRC}/dlfcn.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/iconv.o" "${LIBSHIMSRC}/iconv.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/mman.o" "${LIBSHIMSRC}/mman.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/poll.o" "${LIBSHIMSRC}/poll.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/signal.o" "${LIBSHIMSRC}/signal.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/sys/select.o" "${LIBSHIMSRC}/sys/select.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/termios.o" "${LIBSHIMSRC}/termios.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/time.o" "${LIBSHIMSRC}/time.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSHIMOBJ}/times.o" "${LIBSHIMSRC}/times.c"
x86_64-elf-ar cr \
  "${LIBSHIMLIB}/libshim.a" \
  "${LIBSHIMOBJ}/dlfcn.o" \
  "${LIBSHIMOBJ}/iconv.o" \
  "${LIBSHIMOBJ}/mman.o" \
  "${LIBSHIMOBJ}/poll.o" \
  "${LIBSHIMOBJ}/signal.o" \
  "${LIBSHIMOBJ}/sys/select.o" \
  "${LIBSHIMOBJ}/termios.o" \
  "${LIBSHIMOBJ}/time.o" \
  "${LIBSHIMOBJ}/times.o"

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
