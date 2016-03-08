#
# Copyright (C) 2016 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include $(GENERIC_X86_CONFIG_MK)

LOCAL_PATH := $(call my-dir)
TARGET_SPECIFIC_HEADER_PATH := device/asus/a500cg/include

include device/asus/a500cg/OptAtom.mk

BOARD_CREATE_MODPROBE_SYMLINK := true
HAS_PREBUILT_KERNEL := false
TARGET_PROVIDES_INIT_RC := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := true
TARGET_NO_KERNEL := true
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_VARIANT := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_CPU_SMP := true

TARGET_BOARD_KERNEL_HEADERS := device/asus/a500cg/kernel-headers

INTEL_INGREDIENTS_VERSIONS := true
LOCAL_CFLAGS += -DARCH_IA32
TARGET_PRELINK_MODULE := false

# Add some intel BOOTCLASSPATH
PRODUCT_BOOT_JARS += com.intel.config com.asus.fm com.broadcom.bt

# Skip some proccess to speed up build
BOARD_SKIP_ANDROID_DOC_BUILD := true
BUILD_EMULATOR := false

# Enable ARM codegen for x86 with Houdini
BUILD_ARM_FOR_X86 := true

TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1363148800
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Use dlmalloc
MALLOC_IMPL := dlmalloc

# Malloc Alignment
BOARD_MALLOC_ALIGNMENT := 16

# Appends path to ARM libs for Houdini
PRODUCT_LIBRARY_PATH := $(PRODUCT_LIBRARY_PATH):/system/lib/arm

BOARD_EGL_CFG := device/asus/a500cg/configs/egl.cfg
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Enable dex-preoptimization to speed up first boot sequence
WITH_DEXPREOPT := true

# Wi-Fi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcm43362/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP    := "/system/etc/firmware/fw_bcmdhd_43362_apsta.bin"
WIFI_DRIVER_FW_PATH_STA   := "/system/etc/firmware/fw_bcmdhd_43362.bin"
WIFI_DRIVER_MODULE_ARG := "iface_name=wlan0 firmware_path=/system/etc/firmware/fw_bcmdhd_43362.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote32

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.config.low_ram=false \
    ro.ril.status.polling.enable=0 \
    ro.product.cpu.abi2=armeabi-v7a \
    ro.config.personality=compat_layout

# NFC
BOARD_HAVE_NFC := false

# BINDER
TARGET_USES_64_BIT_BINDER := true

# Audio
BOARD_USES_TINY_ALSA_AUDIO := true

# DRM Protected Video
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1
USE_INTEL_SECURE_AVC := true

# enable ARM codegen for x86 with Houdini
BUILD_ARM_FOR_X86 := true

# HW_Renderer
USE_OPENGL_RENDERER := true

# DPST
INTEL_DPST := true

# HWComposer
BOARD_USES_HWCOMPOSER := true

# RILD
RIL_SUPPORTS_SEEK := true
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_CLASS := ../../../device/asus/a500cg/ril/
SIM_COUNT := 2
ANDROID_MULTI_SIM := true
TARGET_RIL_DISABLE_STATUS_POLLING := true
ADDITIONAL_BUILD_PROPERTIES += ro.ril.status.polling.enable=0

# GPS
BOARD_HAVE_GPS := true

# RMT_STORAGE
BOARD_USES_LEGACY_MMAP := true

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.sf.lcd_density=320 \
    ro.opengles.version=196608 \
    gsm.net.interface=rmnet0 \
    persist.system.at-proxy.mode=0 \
    ro.dalvik.vm.native.bridge=libhoudini.so \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m

# Storage information
BOARD_HAS_LARGE_FILESYSTEM := true

# Reduce space taken by the journal
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Recovery global
BOARD_RECOVERY_SWIPE := true
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"

# Build From source
USE_INTEL_MDP := true
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_USES_MRST_OMX := true
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
INTEL_VA := true
ENABLE_IMG_GRAPHICS := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true
USE_MDS_LEGACY := true
TARGET_HAS_MULTIPLE_DISPLAY := true

#TARGET_HAS_ISV := true
#USE_HW_VP8 := true
USE_INTEL_MULT_THREAD := true
BOARD_CAMERA_PLUGIN := vendor/intel/hardware/camera_extension

# HWcomposer
#INTEL_HWC := true
#TARGET_SUPPORT_HWC_SYS_LAYER := true

# Fix unknown Serial Number
TARGET_IGNORE_RO_BOOT_SERIALNO := true

# Double-Tap-To-Wake
BOARD_HARDWARE_CLASS := device/asus/a500cg/cmhw
BOARD_USES_CYANOGEN_HARDWARE := true
