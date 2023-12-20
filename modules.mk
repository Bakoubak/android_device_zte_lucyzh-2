LOCAL_PATH := device/zte/lucyzh

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

# Audio HAL
PRODUCT_PACKAGES += \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.audio@2.0-service

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power.stats@1.0-service.mock \
    vendor.sprd.hardware.power@4.0-impl \
    vendor.sprd.hardware.power@4.0-service

# AOSP HIDL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service \
    android.hardware.health@1.0-impl

# Light HAL
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service \
    android.hardware.light@2.0-impl

# Sensors HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-service \
    android.hardware.sensors@1.0-impl

# Vibrator HAL
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service \
    android.hardware.vibrator@1.0-impl

# Memtack HAL
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl

# Graphic HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service

# Thermal Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/thermal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal.conf \
    $(LOCAL_PATH)/scenario.conf:system/etc/scenario.conf

PRODUCT_PACKAGES += \
    thermal.default \
    vendor.sprd.hardware.thermal@1.0 \
    vendor.sprd.hardware.thermal@1.0-impl \
    vendor.sprd.hardware.thermal@1.0-service \
    android.hardware.thermal@2.0-service.mock

# DRM/WideVine
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl    \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.2-service.widevine \
    android.hardware.drm@1.2-service.clearkey

# CONNMGR HIDL
PRODUCT_PACKAGES +=  \
    vendor.sprd.hardware.connmgr@1.0-impl \
    vendor.sprd.hardware.connmgr@1.0-service

# FASTBOOTD in Lineage Recovery
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl

# Network HIDL
PRODUCT_PACKAGES += \
    vendor.sprd.hardware.network@1.0 \
    vendor.sprd.hardware.network@1.0-service \
    vendor.sprd.hardware.network@1.0-impl