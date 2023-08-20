TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = SpringBoard
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
# THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Fude

Fude_LIBRARIES = sparkcolourpicker
Fude_FILES = Tweak.x
Fude_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += fudeprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
