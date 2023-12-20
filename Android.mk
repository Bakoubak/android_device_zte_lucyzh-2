LOCAL_PATH := $(call my-dir)

ifneq ($(filter lucyzh, $(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif