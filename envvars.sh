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

CFLAGS="$EFIINCS -I$NEWLIBINC -fno-stack-protector -fpic -fshort-wchar -mno-red-zone -Wall -DEFI_FUNCTION_WRAPPER"
LDFLAGS="-nostdlib -znocombreloc -T $EFI_LDS -shared -Bsymbolic -L $EFILIB $EFI_CRT_OBJS -L $NEWLIBLIB"

BIN_PREFIX="$PREFIX/bin/x86_64-elf-"

# '-C' is a work around the C compiler check.
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
