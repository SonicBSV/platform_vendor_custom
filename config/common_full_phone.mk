# Inherit common stuff
$(call inherit-product, vendor/custom/config/common.mk)

# Telephony
PRODUCT_PACKAGES += \
    Stk

# SMS
PRODUCT_PACKAGES += \
    messaging

$(call inherit-product, vendor/custom/config/telephony.mk)

