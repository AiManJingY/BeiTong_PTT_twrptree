#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from ELINK device
$(call inherit-product, device/elink/ELINK/device.mk)

PRODUCT_DEVICE := ELINK
PRODUCT_NAME := omni_ELINK
PRODUCT_BRAND := ELINK
PRODUCT_MODEL := F496
PRODUCT_MANUFACTURER := elink

PRODUCT_GMS_CLIENTID_BASE := android-elink

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="msm8916_32_512-user 4.4.4 KTU84P eng.liuweiqiang.20201116 test-keys"

BUILD_FINGERPRINT := qcom/msm8916_32_512/msm8916_32_512:4.4.4/KTU84P/eng.liuweiqiang.20201116:user/test-keys
