$(call inherit-product, device/htc/runnymede/full_runnymede.mk)

PRODUCT_RELEASE_NAME := Sensation_XL

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_runnymede BUILD_FINGERPRINT=htc_europe/htc_runnymede/runnymede:2.3.5/GRJ90/156318.4:user/release-keys PRIVATE_BUILD_DESC="2.10.401.4 CL156318 release-keys"

PRODUCT_NAME := cm_runnymede
PRODUCT_DEVICE := runnymede

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := Lexmazter
PRODUCT_VERSION_DEVICE_SPECIFIC := 1.0
