#!/bin/sh
NDK_PATH=~/Android/Sdk/ndk-bundle
./build_helper.sh $NDK_PATH armeabi Debug
./build_helper.sh $NDK_PATH armeabi-v7a Debug
./build_helper.sh $NDK_PATH arm64-v8a Debug
