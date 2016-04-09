#!/usr/bin/env bash

set -e

source $HOME/haskell/ghc/envvars.sh

# echo "CMD: $0 $@" > mooo
# ARG=$1
# ARG1=`echo ${ARG:1:${#ARG}-1}`  # get the tail
# cat $ARG1 > /tmp/ghc/cmds.txt
# cat "/tmp/1804289383846930886.c" > /tmp/ghc/foo.c
# exit 1

# if [ "$1" == "-v" ]; then
#   echo "GNU C (GCC) version 4.9.3 (x86_64-elf)"
#   exit 0
# fi

if [[ "$1" == @* ]]; then
  "${BIN_PREFIX}gcc" $CFLAGS $LDFLAGS \
        "$@" \
        $LIBS \
        -Xlinker --defsym=_DYNAMIC=0
  exit 0
fi

for arg in "$@"; do
  if [ $arg == "-c" ]; then
    "${BIN_PREFIX}gcc" $CFLAGS $LDFLAGS \
          "$@" \
          $LIBS \
          -Xlinker --defsym=_DYNAMIC=0
    exit 0
  fi
done

for arg in "$@"; do
  if [ $arg == "-E" ]; then
    "${BIN_PREFIX}gcc" \
      -fPIC -I$LIBSHIMINC -I$NEWLIBINC \
      -fno-stack-protector -fshort-wchar \
      -mno-red-zone -Wall \
      $HASKELL_BASE_CFLAGS \
      $HASKELL_RTS_CFLAGS \
      $HASKELL_TIME_CFLAGS \
      $LDFLAGS \
      "$@" \
      $LIBS \
      -Xlinker --defsym=_DYNAMIC=0
    exit 0
  fi
done

"${BIN_PREFIX}gcc" $CFLAGS $LDFLAGS \
  $GHC_DIR/efi_main.c "$@" \
  $LIBS \
  -Xlinker --defsym=_DYNAMIC=0
