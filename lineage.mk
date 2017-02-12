# CyanogenMod Specific Changes

# Boot animation
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536

# Camera
PRODUCT_PACKAGES += \
    Snap

PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.cpp.duplication=false

# Gello
PRODUCT_PACKAGES += \
    Gello

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
$(call inherit-product, vendor/cm/config/telephony.mk)

# Inherit device configuration
$(call inherit-product, device/htc/flounder/aosp_flounder.mk)

$(call inherit-product-if-exists, vendor/htc/flounder/device-vendor.mk)

BOARD_NEEDS_VENDORIMAGE_SYMLINK := true

# Inline kernel building
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/htc/flounder
TARGET_KERNEL_CONFIG := lineage_flounder_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := androidboot.selinux=enforcing
TARGET_PREBUILT_KERNEL := false
# Assert for recovery compatibility
TARGET_OTA_ASSERT_DEVICE := flounder,flounder_lte

# Extra Packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras

# CM Overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/flounder/overlay-cm
# Inherrit LTE config
$(call inherit-product, device/htc/flounder/device-lte.mk)
$(call inherit-product-if-exists, vendor/htc/flounder_lte/device-vendor.mk)
# LTE Overlays
DEVICE_PACKAGE_OVERLAYS += \
	device/htc/flounder/lte_only_overlay

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flounder_lte \
    BUILD_FINGERPRINT=google/volantisg/flounder_lte:7.1.1/N4F26Q/3623443:user/release-keys \
    PRIVATE_BUILD_DESC="volantisg-user 7.1.1 N4F26Q 3623443 release-keys"

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_flounder_lte
PRODUCT_DEVICE := flounder_lte
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 9
