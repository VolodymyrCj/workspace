#!/bin/bash
NDK=D:/Android/sdk/ndk-bundle
PLATFORM=$NDK/platforms/android-21/arch-arm64/
TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/windows-x86_64
PREFIX=./android/arm64

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=aarch64-linux \
  --cross-prefix=$TOOLCHAIN/bin/aarch64-linux-android- \
  --sysroot=$PLATFORM

  make clean
  make
  make install
}

build_one

echo Android ARM64 builds finished
