GO_EASY_ON_ME = 1
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = alfiras
alfiras_FILES = Tweak.xm UIAlert+Blocks.m
alfiras_FRAMEWORKS = AVFoundation
alfiras_EXTRA_FRAMEWORKS += cephei
alfiras_LIBRARIES = rocketbootstrap 

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.toyopagroup.picaboo"
SUBPROJECTS += alfiras
include $(THEOS_MAKE_PATH)/aggregate.mk
