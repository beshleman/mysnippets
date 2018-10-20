#!/usr/bin/env bash

# For Udoo board, replace with whatever board or BSP you are using
git clone https://github.com/UDOOboard/linux_kernel
cd linux_kernel

# Replace udoo_neo_defconfig with which ever config you want to use
ARCH=arm make udoo_neo_defconfig

# Compile the kernel, arm-linux-gnueabihf compiles with the ARM ABI expecting hardware support for floating point units
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make zImage -j5
