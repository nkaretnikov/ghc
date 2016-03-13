#!/usr/bin/env bash

set -e

source $HOME/haskell/ghc/envvars.sh

x86_64-elf-gcc $CFLAGS -c -o "${LIBSTUBOBJ}/iconv.o" "${LIBSTUBSRC}/iconv.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSTUBOBJ}/poll.o" "${LIBSTUBSRC}/poll.c"
x86_64-elf-gcc $CFLAGS -c -o "${LIBSTUBOBJ}/times.o" "${LIBSTUBSRC}/times.c"
x86_64-elf-ar cr "${LIBSTUBLIB}/libstub.a" "${LIBSTUBOBJ}/iconv.o" "${LIBSTUBOBJ}/poll.o" "${LIBSTUBOBJ}/times.o"

make
