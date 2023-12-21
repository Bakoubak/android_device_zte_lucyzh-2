LOCAL_PATH := device/zte/lucyzh
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true

BOARD_KERNEL_SEPARATED_DT := true
USES_UNCOMPRESSED_KERNEL := true
BOARD_KERNEL_BASE :=  0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x05400000 --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_PAGESIZE := 2048

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true

# GPU
USE_SPRD_HWCOMPOSER  := true
USE_OPENGL_RENDERER := true
USE_OVERLAY_COMPOSER_GPU := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
SPRD_VIRTUAL_DISPLAY:= 1
TARGET_USES_HWC2 := true
SPRD_TARGET_USES_HWC2 := true
SPRD_SR := true

# Audio Config
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_TINYALSA_AUDIO := true
BOARD_USES_ALSA_AUDIO := false
BUILD_WITH_ALSA_UTILS := false
USE_LEGACY_AUDIO_POLICY := 0
USE_CUSTOM_AUDIO_POLICY := 1
SPRD_VBC_NOT_USE_AD23 := true
SPRD_VBC_DEEPBUFFER_MIXER :=true
SPRD_AUDIO_VOIP_VERSION  :=v2
SPRD_RECORD_USE_MMAP := true

# RIL
BOARD_SPRD_RIL := true
USE_BOOT_AT_DIAG := true

BOARD_RESERVED_SPACE_ON := true

#vsp config
TARGET_JPG_PLATFORM := r8p0
TARGET_VSP_PLATFORM := iwhale2
TARGET_VPP_PLATFORM := sharkl3
SUPPORT_RGB_ENC := true

#SPRD: streaming extention, AOSP should be false.
USE_SPRD_STREAMING_EX := true

#SPRD: set property overrides split
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

TARGET_BOARD_CAMERA_FILTER_VERSION := 0

TARGET_BOARD_CAMERA_ZOOM_FACTOR_SUPPORT := 4

# Camera Optimisation
CONFIG_CAMERA_DFS_FIXED_MAXLEVEL := 3
CONFIG_HAS_CAMERA_HINTS_VERSION := 901

# JPEG Codec Support
TARGET_BOARD_SPRD_JPEG_CODEC_SUPPORT := true

# bsp uapi path
TARGET_BSP_UAPI_PATH := $(TOP)/bsp/out/$(TARGET_BOARD)/headers
TARGET_BSP_KERNEL_PATH := $(TOP)/bsp/kernel/$(KERNEL_PATH)

#for cali mode use boot.img
BOARD_CALIMODE_USE_BOOTIMG := true

# Board Name
BOARD_NAME := sharkl3

# Dynamic Partition
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
BOARD_SUPER_PARTITION_SIZE := 4299161600
BOARD_SUPER_PARTITION_GROUPS := group_unisoc
BOARD_GROUP_UNISOC_SIZE := 4299161600
BOARD_GROUP_UNISOC_PARTITION_LIST := system vendor product

# Kernel
TARGET_KERNEL_OPTIONAL_LD := true
KERNEL_SUPPORTS_LLVM_TOOLS := true

TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# clang-r450784d = Kernel Android 13
TARGET_KERNEL_CLANG_VERSION := r416183b1
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-$(TARGET_KERNEL_CLANG_VERSION)

# Kernel Source
TARGET_KERNEL_CONFIG := lucyzh_defconfig
TARGET_KERNEL_SOURCE := kernel/zte/lucyzh
BOARD_KERNEL_IMAGE_NAME := Image

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy-vendor/selinux/vendor
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy-vendor/selinux/system/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy-vendor/selinux/system/public