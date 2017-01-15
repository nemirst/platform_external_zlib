cmake_minimum_required(VERSION 3.4.1)

set(CMAKE_VERBOSE_MAKEFILE on)

file(GLOB minizip-lib-src
    "ioapi.c"
    "miniunz.c"
    "minizip.c"
    "mztools.c"
    "unzip.c"
    "zip.c"
)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DIOAPI_NO_64")

add_library( # Sets the name of the library.
             minizip-lib

             # Sets the library as a shared library.
             STATIC

             # Provides a relative path to your source file(s).
             # Associated headers in the same location as their source
             # file are automatically included.
             ${minizip-lib-src} )

include_directories(../../../dist/${ANDROID_ABI}/includes/zlib)