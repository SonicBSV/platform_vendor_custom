include vendor/custom/build/core/config.mk

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

# Custom overlays
PRODUCT_PACKAGES += \
    custom-overlays \
    ThemePicker

# RecueParty? No thanks.
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.enable_rescue=false

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/custom/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/custom/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/custom/prebuilt/common/bin/50-base.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-base.sh \
    vendor/custom/prebuilt/common/bin/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/custom/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# Permissions
PRODUCT_COPY_FILES += \
    vendor/custom/config/permissions/privapp-permissions-platform.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-platform.xml \

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Optional packages
PRODUCT_PACKAGES += \
    PhotoTable \
    Terminal \
    MusicFX \
    SoundRecorder \
    ThemePicker \
    Calculator \
    LatinIME \
    BluetoothExt \
    Launcher3Dark

# Extra tools
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

# Backup services whitelist
PRODUCT_COPY_FILES += \
    vendor/custom/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

PRODUCT_PACKAGES += \
    charger_res_images

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    JustCAF_options

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/custom/prebuilt/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    vendor/custom/prebuilt/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Don't build tests
EXCLUDE_SYSTEMUI_TESTS := true

ifneq ($(WITH_ROOT),false)
# Root
PRODUCT_COPY_FILES += \
    vendor/custom/prebuilt/zip/magisk.zip:system/addon.d/magisk.zip

PRODUCT_COPY_FILES += \
    vendor/custom/prebuilt/common/bin/busybox-arm:install/bin/busybox
endif

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    Launcher3

DEVICE_PACKAGE_OVERLAYS += vendor/custom/overlay/common

# Set all versions
CAF_TAG := $(shell grep "<default revision=" manifest/codeaurora.xml | awk -F'"' '{print $$2}' | awk  -F "/" '{print $$3}')

PRODUCT_PROPERTY_OVERRIDES += \
    ro.caf.revision=$(CAF_TAG)

include vendor/custom/config/qualcomm.mk
include vendor/custom/sdclang/sdclang.mk
