#!/bin/sh -e
# binutils-SPU.sh by Dan Peori (dan.peori@oopo.net)

BINUTILS="binutils-2.25"

if [ ! -d ${BINUTILS} ]; then

  ## Download the source code.
  if [ ! -f ${BINUTILS}.tar.bz2 ]; then wget --continue ftp://ftp.gnu.org/gnu/binutils/${BINUTILS}.tar.bz2; fi

  ## Unpack the source code.
  tar xfvj ${BINUTILS}.tar.bz2

fi

if [ ! -d ${BINUTILS}/build-spu ]; then

  ## Create the build directory.
  mkdir ${BINUTILS}/build-spu

fi

## Enter the build directory.
cd ${BINUTILS}/build-spu

## Configure the build.
../configure --prefix="$PS3DEV/spu" --target="spu" \
    --disable-nls \
    --disable-shared \
    --disable-debug \
    --disable-dependency-tracking \
    --disable-werror \
    --with-gcc \
    --with-gnu-as \
    --with-gnu-ld

## Compile and install.
${MAKE:-make} -j 4 && ${MAKE:-make} install
