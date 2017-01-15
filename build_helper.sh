#!/bin/sh
echo "Building $2 version"
$1/../cmake/3.6.3155560/bin/cmake \
-H`pwd`/src \
-B`pwd`/cmake_build_$2 \
-G"Android Gradle - Ninja" \
-DANDROID_ABI=$2 \
-DANDROID_NDK=$1 \
-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=`pwd`/cmake_output_$2 \
-DCMAKE_BUILD_TYPE=$3 \
-DCMAKE_MAKE_PROGRAM=$1/../cmake/3.6.3155560/bin/ninja \
-DCMAKE_TOOLCHAIN_FILE=$1/build/cmake/android.toolchain.cmake \
-DANDROID_NATIVE_API_LEVEL=19 \
-DANDROID_TOOLCHAIN=clang \
-DANDROID_STL=c++_static \
-DCMAKE_CXX_FLAGS=-O2 \
-DCMAKE_C_FLAGS=-O2
[ $? -eq 0 ] || exit $?;
$1/../cmake/3.6.3155560/bin/ninja -C ./cmake_build_$2
[ $? -eq 0 ] || exit $?;
# Creates includes directory which can be used when building src/contrib
# projects (like minizip) because zonf.h on Android is architecture dependent.
mkdir -p dist/$2/includes/zlib
cp zlib.h dist/$2/includes/zlib
cp cmake_build_$2/zconf.h dist/$2/includes/zlib
cp cmake_build_$2/libz.a dist/$2
echo "Done building $2 version"
