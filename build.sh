export TARGET=mips-baremetal-elf
export PREFIX=`pwd`/toolchain/
set -e
 
echo "building binutils"
 
mkdir -p build-binutils
cd build-binutils
../binutils-2.23.2/configure --target=$TARGET --prefix=$PREFIX
make
make install
cd ..
 
echo "building gcc..."
mkdir -p build-gcc
cd build-gcc
../gcc-4.8.1/configure --disable-lto --target=$TARGET --prefix=$PREFIX --disable-nls --enable-languages=c
make all-gcc
make install-gcc
make all-target-libgcc
make install-target-libgcc
cd ..
 
echo "toolchain build complete!"
