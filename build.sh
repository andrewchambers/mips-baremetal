 export TARGET=mips-baremetal-elf
 export PREFIX=`pwd`/toolchain/
 set -e
 mkdir -p build-binutils
 cd build-binutils
 ../binutils-2.23.2/configure --target=$TARGET --prefix=$PREFIX
 make
 make install
 echo "build complete!"
