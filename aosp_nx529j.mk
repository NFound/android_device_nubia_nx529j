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

# Inherit some common AOSP stuff.
$(call inherit-product, vendor/aosp/common.mk)

# Use Magisk
DEFAULT_ROOT_METHOD := magisk

# Inherit from nx529j device
$(call inherit-product, device/nubia/nx529j/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nx529j
PRODUCT_NAME := aosp_nx529j
PRODUCT_BRAND := Nubia
PRODUCT_MODEL := Nubia Z11 mini
PRODUCT_MANUFACTURER := Nubia

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="NX529J" \
    BUILD_FINGERPRINT="Nubia/NX529J/NX529J:7.0/NRD90M/20160927.144351:user/release-keys" \
    PRIVATE_BUILD_DESC="NX529J-user 7.0 NRD90M eng.nubia.20160927.144351 release-keys"
