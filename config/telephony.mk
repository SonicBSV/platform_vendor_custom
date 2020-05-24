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

# Dual SIM - allow setting calling account to 'Ask every time'
# rather than resetting to sub 1 every boot
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.radio.aosp_usr_pref_sel=true

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

