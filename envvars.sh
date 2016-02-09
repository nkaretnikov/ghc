export PATH="$HOME/x86_64/bin:/usr/local/bin:/usr/bin:/bin"
export PREFIX="$HOME/x86_64"
export TARGET="x86_64-elf"
# export C_INCLUDE_PATH=$PREFIX/include/efi:$PREFIX/x86_64-elf/include
# export LD_LIBRARY_PATH=$PREFIX/lib:$PREFIX/x86_64-elf/lib

ARCH="x86_64"

EFIINC="$HOME/x86_64/include/efi"
EFIINCS="-I$EFIINC -I$EFIINC/$ARCH -I$EFIINC/protocol"
EFILIB="$HOME/x86_64/lib"
EFI_CRT_OBJS="$EFILIB/crt0-efi-${ARCH}.o"
EFI_LDS="$EFILIB/elf_${ARCH}_efi.lds"
NEWLIBINC="$HOME/x86_64/x86_64-elf/include"
NEWLIBLIB="$HOME/x86_64/x86_64-elf/lib"

# XXX: I locally added a check for __x86_64__ to <sys/unistd.h> to expose
# 'ftruncate'.  Ditto for 'siginfo_t' in <sys/signal.h>.  This should be
# reported upstream.
#
# XXX: I've been told that it might be easier to pass CFLAGS and LDFLAGS
# directly to '--with-gcc' and '--with-ld'.  Haven't tried that yet.
#
# XXX: Move the definition of '_POSIX_THREADS' (from
# utils/deriveConstants/Main.hs) here.
HASKELL_BASE_CFLAGS="-DHAVE_UNISTD_H=1 -DHAVE_FTRUNCATE=1 -D__x86_64__=1 -DHAVE_TERMIOS_H=0 -D_POSIX_REALTIME_SIGNALS=1"
HASKELL_TIME_CFLAGS="-D__TM_ZONE=tm_zone"
EFI_CFLAGS="$EFIINCS -I$NEWLIBINC -fno-stack-protector -fpic -fshort-wchar -mno-red-zone -Wall -DEFI_FUNCTION_WRAPPER"
CFLAGS="$EFI_CFLAGS $HASKELL_BASE_CFLAGS $HASKELL_TIME_CFLAGS"
LDFLAGS="-nostdlib -znocombreloc -T $EFI_LDS -shared -Bsymbolic -L $EFILIB $EFI_CRT_OBJS -L $NEWLIBLIB"

export CONF_CC_OPTS_STAGE1="$CFLAGS"
export CONF_GCC_LINKER_OPTS_STAGE1="$LDFLAGS"

BIN_PREFIX="$PREFIX/bin/x86_64-elf-"
LIBS="-lefi -lgnuefi -lc" \
