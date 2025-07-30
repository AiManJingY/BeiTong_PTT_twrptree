#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/elink/ELINK

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_USES_64_BIT_BINDER := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8916
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 114

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci earlyprintk
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_CONFIG := ELINK_defconfig
TARGET_KERNEL_SOURCE := kernel/elink/ELINK

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DT := $(DEVICE_PATH)/prebuilt/dt.img
BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DT)
BOARD_KERNEL_SEPARATED_DT := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 26159104
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := msm8916

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration


TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_THEME := portrait_mdpi
TW_EXCLUDE_DEFAULT_LANGUAGE := true  # 仅保留英文（移除多语言）
TW_DEFAULT_LANGUAGE := en  # 默认语言为英语
TW_EXTRA_KEYBOARDS :=      # 仅保留默认虚拟键盘布局
TW_DEFAULT_FONT := default    # 使用默认的字体
TW_EXTRA_FONTS :=          # 仅加载默认字体
BOARD_RECOVERYIMAGE_EXTRA_ARGS := --compress  # 对镜像进行压缩
TW_DEFAULT_KEYBOARD := qwerty  # 指定TWRP默认使用的虚拟键盘布局
TW_EXTRA_LANGUAGES := zh_CN  # 额外添加多语言只支持中文
TW_NO_SCREEN_BLANK := true  # 禁止屏幕休眠动画
TW_EXCLUDE_SUPERSU := true      # 不集成 SuperSU
TW_EXCLUDE_MTP := true          # 禁用 MTP 支持
TW_EXCLUDE_TWRPAPP := true      # 不打包 TWRP App
TW_EXCLUDE_NANO := true         # 不集成 nano 编辑器
TW_EXCLUDE_BASH := true         # 不集成 bash shell
TW_EXCLUDE_FUSE := true         # 禁用 FUSE（如果不需要）
TW_EXCLUDE_PYTHON := true       # 移除 Python 支持（如果有）
TW_USE_TOOLBOX := true          # 使用 toolbox 替代 busybox（部分设备支持）

# 仅支持 ext4 和 vfat（减少内核模块）
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
TW_NO_NTFS := true
TW_NO_F2FS := true


