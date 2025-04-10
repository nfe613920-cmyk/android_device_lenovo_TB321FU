#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_DEVICE := TB321FU
PRODUCT_NAME := twrp_TB321FU
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Lenovo TB321FU
PRODUCT_MANUFACTURER := lenovo

PRODUCT_GMS_CLIENTID_BASE := android-lenovo

# Inherit from TB321FU device
$(call inherit-product, device/lenovo/TB321FU/device.mk)
