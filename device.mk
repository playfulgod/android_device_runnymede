#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)

# The gps config appropriate for this device

PRODUCT_COPY_FILES += device/htc/runnymede/prebuilt/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/root/init.runnymede.rc:root/init.runnymede.rc \
    device/htc/runnymede/prebuilt/root/ueventd.runnymede.rc:root/ueventd.runnymede.rc

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/runnymede/runnymede-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/runnymede/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/voicemail-conf.xml:system/etc/voicemail-conf.xml

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    gps.runnymede \
    lights.runnymede \
    sensors.runnymede

#HWC Hal
PRODUCT_PACKAGES += \
    hwcomposer.msm7x30\
    gralloc.msm7x30

# audio
PRODUCT_PACKAGES += \
  audio.a2dp.default \
  audio_policy.default

# video
PRODUCT_PACKAGES += \
  libI420colorconvert

# Additional packages
PRODUCT_PACKAGES += \
    GooManager \
    FileExplorer

# idc files
#    device/htc/runnymede/prebuilt/usr/idc/runnymede-keypad.idc:system/usr/idc/runnymede-keypad.idc \
#    device/htc/runnymede/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
#    device/htc/runnymede/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/runnymede/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/runnymede/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/runnymede/prebuilt/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/runnymede/prebuilt/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/runnymede/prebuilt/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/runnymede/prebuilt/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/htc/runnymede/prebuilt/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad.kl:system/usr/keylayout/runnymede-keypad.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \

PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/runnymede/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf

# bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf 

# apn config file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# init.d files
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/etc/init.d/01swap:system/etc/init.d/01swap

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/runnymede/prebuilt/root/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Kernel modules
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# HTC Audio
$(call inherit-product, device/htc/runnymede/media_a1026.mk)
$(call inherit-product, device/htc/runnymede/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

