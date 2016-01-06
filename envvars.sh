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
# 'ftruncate'.  This should be reported upstream.
#
# XXX: I've been told that it might be easier to pass CFLAGS and LDFLAGS
# directly to '--with-gcc' and '--with-ld'.  Haven't tried that yet.
#
# XXX: Move the definition of '_POSIX_THREADS' (from
# utils/deriveConstants/Main.hs) here.
HASKELL_BASE_CFLAGS="-DHAVE_UNISTD_H=1 -DHAVE_FTRUNCATE=1 -D__x86_64__=1 -DHAVE_TERMIOS_H=0"
EFI_CFLAGS="$EFIINCS -I$NEWLIBINC -fno-stack-protector -fpic -fshort-wchar -mno-red-zone -Wall -DEFI_FUNCTION_WRAPPER"
CFLAGS="$EFI_CFLAGS $HASKELL_BASE_CFLAGS"
LDFLAGS="-nostdlib -znocombreloc -T $EFI_LDS -shared -Bsymbolic -L $EFILIB $EFI_CRT_OBJS -L $NEWLIBLIB"

export CONF_CC_OPTS_STAGE1="$CFLAGS"
export CONF_GCC_LINKER_OPTS_STAGE1="$LDFLAGS"

BIN_PREFIX="$PREFIX/bin/x86_64-elf-"

# XXX: I commented out the C compiler checks in 'configure' scripts, so the '-C'
# flag is required to correctly set the sizes and so on.
./configure \
  CC="${BIN_PREFIX}gcc" \
  CPP="${BIN_PREFIX}gcc -E" \
  CFLAGS="$CFLAGS" \
  LDFLAGS="$LDFLAGS" \
  LIBS="-lefi -lgnuefi -lc" \
  -C \
  --target=$TARGET \
  --prefix=$PREFIX \
  --with-gcc="${BIN_PREFIX}gcc" \
  --with-ld="${BIN_PREFIX}ld" \
  --with-nm="${BIN_PREFIX}nm" \
  --with-ar="${BIN_PREFIX}ar" \
  --with-ranlib="${BIN_PREFIX}ranlib" \
  --with-objdump="${BIN_PREFIX}objdump"
