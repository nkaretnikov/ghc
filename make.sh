#!/usr/bin/env bash

source $HOME/haskell/ghc/envvars.sh

x86_64-elf-gcc $CFLAGS -c -o "${LIBSTUBOBJ}/poll.o" "${LIBSTUBSRC}/poll.c"
x86_64-elf-ar cr "${LIBSTUBLIB}/libstub.a" "${LIBSTUBOBJ}/poll.o"

make
