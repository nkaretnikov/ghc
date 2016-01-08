source envvars.sh

# XXX: I commented out the C compiler checks in 'configure' scripts, so the '-C'
# flag is required to correctly set the sizes and so on.
./configure \
  CPP="${BIN_PREFIX}gcc -E" \
  -C \
  --target=$TARGET \
  --prefix=$PREFIX \
  --with-gcc="/home/nikita/haskell/ghc/gcc.sh" \
  --with-ld="/home/nikita/haskell/ghc/ld.sh" \
  --with-nm="${BIN_PREFIX}nm" \
  --with-ar="${BIN_PREFIX}ar" \
  --with-ranlib="${BIN_PREFIX}ranlib" \
  --with-objdump="${BIN_PREFIX}objdump"
