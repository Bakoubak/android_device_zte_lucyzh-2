$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

$(call inherit-product, device/zte/lucyzh/device.mk)

# Get Lineage config
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device informations
PRODUCT_NAME := lineage_lucyzh
PRODUCT_DEVICE := lucyzh
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Blade A5 2019
PRODUCT_MANUFACTURER := ZTE