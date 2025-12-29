LOCAL_PATH := device/xiaomi/blossom

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 29

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Crypto
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz:kernel

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service-recovery \
    android.hardware.gatekeeper@1.0-impl-recovery

PRODUCT_PACKAGES += \
    libshim_beanpod

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.gatekeeper=beanpod

# Keymaster
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# libion & libxml2
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libxml2

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so
