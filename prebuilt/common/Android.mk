LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := apns-conf.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_PREBUILT_MODULE_FILE := vendor/custom/prebuilt/common/etc/apns-conf.xml
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)
