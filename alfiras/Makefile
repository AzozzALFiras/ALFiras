include /opt/theos/makefiles/common.mk

BUNDLE_NAME = ALFiras
ALFiras_FILES = ALFiras.m
ALFiras_INSTALL_PATH = /Library/PreferenceBundles
ALFiras_FRAMEWORKS = UIKit
ALFiras_PRIVATE_FRAMEWORKS = Preferences

include /opt/theos/makefiles/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ALFiras.plist$(ECHO_END)
