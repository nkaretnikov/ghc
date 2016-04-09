set -e

export PATH="$HOME/x86_64/bin:/usr/local/bin:/usr/bin:/bin"
export PREFIX="$HOME/x86_64-elf"
export TARGET="x86_64-elf"
GHC_DIR="$HOME/haskell/ghc"
# export C_INCLUDE_PATH=$PREFIX/include/efi:$PREFIX/x86_64-elf/include
# export LD_LIBRARY_PATH=$PREFIX/lib:$PREFIX/x86_64-elf/lib

ARCH="x86_64"

EFIINC="$HOME/x86_64/include/efi"
EFIINCS="-I$EFIINC -I$EFIINC/$ARCH -I$EFIINC/protocol"
EFILIB="$HOME/x86_64/lib"
EFI_CRT_OBJS="$EFILIB/crt0-efi-${ARCH}.o"
EFI_LDS="$EFILIB/elf_${ARCH}_efi.lds"
LIBSHIMINC="$GHC_DIR/libshim/include"
LIBSHIMLIB="$GHC_DIR/libshim/lib"
LIBSHIMOBJ="$GHC_DIR/libshim/obj"
LIBSHIMSRC="$GHC_DIR/libshim/src"
# Required due to #include_next in <limits.h>.  The order is important, too:
# libshim should go first followed by newlib.
NEWLIBINC="$GHC_DIR/libshim/newlib/x86_64-elf/include"
NEWLIBLIB="$GHC_DIR/libshim/newlib/x86_64-elf/lib"

# XXX: I locally added a check for __x86_64__ to <sys/unistd.h> to expose
# 'ftruncate'.  Ditto for 'siginfo_t' in <sys/signal.h>.  This should be
# reported upstream.
#
# XXX: I've been told that it might be easier to pass CFLAGS and LDFLAGS
# directly to '--with-gcc' and '--with-ld'.  Haven't tried that yet.
#
HASKELL_BASE_CFLAGS="-DHAVE_UNISTD_H=1 -DHAVE_FTRUNCATE=1 -D__x86_64__=1 -DHAVE_TERMIOS_H=0 -D_POSIX_REALTIME_SIGNALS=1"
HASKELL_RTS_CFLAGS="-D_POSIX_THREADS=1 -D_UNIX98_THREAD_MUTEX_ATTRIBUTES=1"
HASKELL_TIME_CFLAGS="-D__TM_ZONE=tm_zone"
EFI_CFLAGS="-fPIC $EFIINCS -I$LIBSHIMINC -I$NEWLIBINC -fno-stack-protector -fshort-wchar -mno-red-zone -Wall -DEFI_FUNCTION_WRAPPER"
CFLAGS="$EFI_CFLAGS $HASKELL_BASE_CFLAGS $HASKELL_RTS_CFLAGS $HASKELL_TIME_CFLAGS"
LDFLAGS="-nostdlib -znocombreloc -T $EFI_LDS -shared -L $EFILIB $EFI_CRT_OBJS -L $LIBSHIMLIB -L $NEWLIBLIB"

export CONF_CC_OPTS_STAGE1="$CFLAGS"
export CONF_GCC_LINKER_OPTS_STAGE1="$LDFLAGS"

BIN_PREFIX="$PREFIX/bin/x86_64-elf-"
LIBS="-Bstatic -lc -Bsymbolic -lefi -lgnuefi -lshim"
