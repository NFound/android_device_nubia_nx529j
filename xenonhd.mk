#
# Copyright 2015 The CyanogenMod Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common DU stuff.
$(call inherit-product, vendor/xenonhd/config/common_full_phone.mk)

# Root
ROOT_METHOD=magisk

# Inherit from nx529j device
$(call inherit-product, device/nubia/nx529j/device.mk)

# Set those variables here to overwrite the inherited values.
BOARD_VENDOR := Nubia
PRODUCT_BRAND := Nubia
PRODUCT_DEVICE := nx529j
PRODUCT_NAME := xenonhd_nx529j
PRODUCT_MANUFACTURER := Nubia
PRODUCT_MODEL :=Nubia Z11 mini
TARGET_VENDOR := Nubia

PRODUCT_GMS_CLIENTID_BASE := android-zte

#Maintainer Info
PRODUCT_PROPERTY_OVERRIDES += ro.xenonhd.maintainer=NFound

# Use the latest approved GMS identifiers unless running a signed build
ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=nubia/NX529J/NX529J:7.1.1/NOF27B/1b15541367:userdebug/test-keys \
    PRIVATE_BUILD_DESC="NX529J-user 7.1.1 NOF27B eng.nubia.20160927.144351 release-keys"
endif
