LOCAL_PATH := device/zte/lucyzh

BOARD_VNDK_VERSION := current
OMA_DRM := true

# OMA DRM
PRODUCT_PACKAGES += \
    libdrmomaplugin

ifeq ($(OMA_DRM),true)
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true
else
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=false
endif

# VNDK
PRODUCT_PACKAGES +=\
    vndk_package

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/vndk/system.public.libraries-sprd.txt:system/etc/public.libraries-sprd.txt \
     $(LOCAL_PATH)/vndk/vendor.public.libraries.txt:vendor/etc/public.libraries.txt

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/root/init.common.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.common.rc \
    $(LOCAL_PATH)/recovery/init.recovery.common.rc:root/init.recovery.common.rc \
    $(BOARDDIR)/recovery/init.recovery.$(TARGET_BOARD).rc:root/init.recovery.$(TARGET_BOARD).rc \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/adaptive_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/adaptive_ts.kl \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    $(LOCAL_PATH)/rootdir/system/usr/idc/adaptive_ts.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/adaptive_ts.idc \
    $(LOCAL_PATH)/rootdir/system/media/engtest_sample.pcm:system/media/engtest_sample.pcm

ifeq ($(strip $(TARGET_GPU_PLATFORM)), soft)
PRODUCT_PACKAGES +=  \
        libGLES_android \
        libEGL       \
        libGLESv1_CM \
        libGLESv2
ifeq ($(strip $(USE_SPRD_HWCOMPOSER)),true)
$(error, USE_SPRD_HWCOMPOSER should not be true)
endif

else # $(TARGET_GPU_PLATFORM)), soft)
ifeq ($(strip $(TARGET_GPU_PLATFORM)), midgard)
PRODUCT_PACKAGES += mali.ko gralloc.$(TARGET_BOARD_PLATFORM).so
PRODUCT_PACKAGES += \
    libGLES_mali_64.so \
    libGLES_mali.so \
    libRSDriverArm_64.so \
    libRSDriverArm.so \
    libbccArm_64.so \
    libbccArm.so \
    libmalicore_64.bc \
    libmalicore.bc \
    libhwc2on1adapter.so

# Camera HAL
PRODUCT_PACKAGES += \
     android.hardware.camera.provider@2.4-impl-sprd \
     android.hardware.camera.provider@2.4-service

OVERRIDE_RS_DRIVER := libRSDriverArm.so
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.gpu.boost=0
endif # $(TARGET_GPU_PLATFORM)), midgard)

ifeq ($(strip $(TARGET_GPU_PLATFORM)), rogue)
PRODUCT_PACKAGES += \
    pvrdebug \
    pvrhwperf \
    pvrlogdump \
    pvrlogsplit \
    pvrtld \
    pvrhtb2txt \
    pvrhtbd \
    rscompiler \
    libadf \
    libadfhwc \
    libdrm \
    rgx.fw.signed.22.86.104.218 \
    libEGL_POWERVR_ROGUE.so \
    libGLESv1_CM_POWERVR_ROGUE.so \
    libGLESv2_POWERVR_ROGUE.so \
    gralloc.$(TARGET_BOARD_PLATFORM).so \
    memtrack.$(TARGET_BOARD_PLATFORM).so \
    libcreatesurface.so \
    libglslcompiler.so \
    libIMGegl.so \
    libpvrANDROID_WSEGL.so \
    libPVRRS.so \
    libPVRScopeServices.so \
    libsrv_um.so \
    libsutu_display.so \
    libtqvalidate.so \
    libusc.so \
    libhwc2on1adapter.so
endif

ifeq ($(strip $(USE_SPRD_HWCOMPOSER)),true)
$(warning, if sprd hwcomposer is not ready, USE_SPRD_HWCOMPOSER should not be true)
PRODUCT_PACKAGES +=  hwcomposer.$(TARGET_BOARD_PLATFORM)
endif

endif

ifeq ($(strip $(USE_AUDIO_WHALE_HAL)),true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.mmi.use.audio.whale.hal=1
endif
ifeq ($(strip $(TARGET_CAMERA_SENSOR_CCT)),"ams_tcs3430")
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.mmi.camera.sensor.cct=ams_tcs3430
endif
ifeq ($(strip $(TARGET_CAMERA_SENSOR_TOF)),"tof_vl53l0")
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.mmi.camera.sensor.tof=tof_vl53l0
endif

# multimedia configs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(LOCAL_PATH)/files/codecs/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    $(LOCAL_PATH)/files/codecs/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/files/codecs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/files/codecs/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/files/codecs/media_profiles_turnkey.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_turnkey.xml \
    $(LOCAL_PATH)/files/codecs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/files/codecs/media_codecs_performance_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_c2.xml \
    $(LOCAL_PATH)/files/codecs/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Audio Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/audio_effect/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/rootdir/system/etc/audio_effect/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# SWAP with ZRam
$(LOCAL_PATH)/files/fstab.zram:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.enableswap

#for lmkd parameters
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/lmkd_param.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lmkd_param.conf

# Power Framework
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/modules/power/fw-power-config/power_info.db:system/etc/power_info.db \
    $(LOCAL_PATH)/files/modules/power/fw-power-config/appPowerSaveConfig.xml:system/etc/appPowerSaveConfig.xml \
    $(LOCAL_PATH)/files/modules/power/fw-power-config/blackAppList.xml:system/etc/blackAppList.xml \
    $(LOCAL_PATH)/files/modules/power/fw-power-config/pwctl_config.xml:system/etc/pwctl_config.xml \
    $(LOCAL_PATH)/files/modules/power/fw-power-config/powercontroller.xml:system/etc/powercontroller.xml \
    $(LOCAL_PATH)/files/modules/power/fw-power-config/deviceidle.xml:system/etc/deviceidle.xml

#Display PQ ABC
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.pq.enabled=1

# Network related modules
PRODUCT_PACKAGES += \
    dhcp6c \
    dhcp6s \
    radvd \
    tcpdump \
    ext_data \
    ip_monitor.sh \
    tiny_firewall.sh \
    data_rps.sh \
    netbox.sh

PRODUCT_PROPERTY_OVERRIDES += \
   persist.vendor.bsservice.enable=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    sys.usb.controller=musb-hdrc.0.auto

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/root/ueventd.rc:recovery/root/ueventd.rc \
    $(LOCAL_PATH)/recovery/recovery.tmpfsdata.fstab:recovery/root/system/etc/recovery.tmpfsdata.fstab

# This FS doesn't have HEH encryption, so use AES-256-CTS.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts

# F2FS Support
ifeq (f2fs,$(strip $(BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE)))
TARGET_USERIMAGES_USE_F2FS := true
endif

$(call inherit-product, $(LOCAL_PATH)/modules.mk)