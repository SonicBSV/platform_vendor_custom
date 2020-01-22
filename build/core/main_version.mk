# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Set custom build
CUSTOM_BUILD := true

# Set theming prop
ADDITIONAL_BUILD_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.android.theme.color.pixel;com.android.theme.icon.roundedrect;com.android.theme.font.googlesans

