# World APN list
PRODUCT_COPY_FILES += \
    vendor/custom/prebuilt/common/etc/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# Default sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Triton.ogg \
    ro.config.notification_sound=Rhea.ogg \
    ro.config.alarm_alert=Osmium.ogg

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

