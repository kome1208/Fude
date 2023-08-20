TARGET := iphone:clang:latest:14.0
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Fude

Fude_FILES = FudeRootListController.m
Fude_FRAMEWORKS = UIKit
Fude_LIBRARIES = sparkcolourpicker
Fude_PRIVATE_FRAMEWORKS = Preferences
Fude_INSTALL_PATH = /Library/PreferenceBundles
Fude_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
