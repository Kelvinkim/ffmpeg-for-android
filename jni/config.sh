#!/bin/bash
SYSROOT=$NDK_ROOT/platforms/android-9/arch-arm/
TOOLCHAIN=$NDK_ROOT/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64

function build_one
{
./configure \
    --prefix=$PREFIX \
    --enable-shared \
    --enable-static \
    --disable-doc \
	--disable-asm \
	--disable-yasm \
	--enable-decoder=h264 \
	--enable-decoder=mpeg4 \
	--disable-ffmpeg \
	--enable-parser=h264 \
	--enable-parser=mpeg4video \
	--enable-parser=mpegvideo \
    --disable-ffserver \
    --enable-cross-compile \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --target-os=linux \
    --arch=arm \
	--enable-neon \
    --sysroot=$SYSROOT \
    --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS" \
    $ADDITIONAL_CONFIGURE_FLAG
}
CPU=armeabi
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="-marm"
build_one
