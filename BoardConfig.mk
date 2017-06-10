#
# Copyright (C) 2016 The CyanogenMod Project
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
#USE_CLANG_PLATFORM_BUILD := true

DEVICE_PATH := device/nubia/nx529j

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

USE_NINJA := false

PRODUCT_COPY_FILES := $(filter-out frameworks/base/data/keyboards/Generic.kl:system/usr/keylayout/Generic.kl , $(PRODUCT_COPY_FILES))

#USE_NINJA := false
# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_CORTEX_A53 := true

TARGET_BOARD_PLATFORM := msm8952
TARGET_BOARD_PLATFORM_GPU := qcom-adreno405
TARGET_BOARD_SUFFIX := _64

TARGET_USES_64_BIT_BINDER := true
ENABLE_CPUSETS := true
#ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8952
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=null  androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/nubia/msm8952
TARGET_KERNEL_CONFIG := msm8952_nx529j_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9-mkm/bin

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Assert
TARGET_OTA_ASSERT_DEVICE := NX529J

# Audio
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_VOICE_CONCURRENCY := true

AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_BTNV := true
QCOM_BT_USE_SMD_TTY := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
#TARGET_USE_COMPAT_GRALLOC_ALIGN := true
# Force camera module to be compiled only in 32-bit mode on 64-bit systems
# Once camera module can run in the native mode of the system (either
# 32-bit or 64-bit), the following line should be deleted
BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += hardware/cyanogen/cmhw
TARGET_TAP_TO_WAKE_NODE := "/data/tp/easy_wakeup_gesture"

# CNE
BOARD_USES_QCNE := true

# Dex pre-opt to speed up initial boot
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true

# Display
BOARD_EGL_CFG := $(DEVICE_PATH)/configs/egl.cfg
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
USE_OPENGL_RENDERER := true
TARGET_USES_OVERLAY := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# FM
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 58711850496 # (58711850496 - 16384)
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_ANDROID_FILESYSTEM_CONFIG_H := $(DEVICE_PATH)/android_filesystem_config.h

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Keymaster
TARGET_PROVIDES_KEYMASTER := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Peripheral manager
TARGET_PER_MGR_ENABLED := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Qualcomm
BOARD_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
TARGET_USES_QCOM_BSP := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Radio
ADD_RADIO_FILES := true
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
#TARGETS_THAT_NEED_SW_VENC_HEVC := true

# RIL
TARGET_RIL_VARIANT := caf
SIM_COUNT := 2
#BOARD_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_11
#BOARD_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_11
TARGET_GLOBAL_CFLAGS += -DANDROID_MULTI_SIM
TARGET_GLOBAL_CPPFLAGS += -DANDROID_MULTI_SIM

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Sensors
USE_SENSOR_MULTI_HAL := true

# Wifi
TARGET_PROVIDES_WCNSS_QMI := true

# The uncompressed arm64 is too large, split wifi for now
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# inherit from the proprietary version
-include vendor/nubia/nx529j/BoardConfigVendor.mk
