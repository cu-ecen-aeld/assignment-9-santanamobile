##############################################################
#
# AESD-CHARDRIVER
#
##############################################################

AESD_CHARDRIVER_VERSION = 'a82245147522be2060c291c3b4b76dad1ca94ea6'
AESD_CHARDRIVER_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-santanamobile.git'
AESD_CHARDRIVER_SITE_METHOD = git
AESD_CHARDRIVER_GIT_SUBMODULES = YES
AESD_CHARDRIVER_MODULE_SUBDIRS = aesd-char-driver

define AESD_CHARDRIVER_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
        $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
