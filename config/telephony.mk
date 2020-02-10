# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    Messaging \
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

