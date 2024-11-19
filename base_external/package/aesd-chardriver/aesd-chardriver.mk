##############################################################
#
# AESD-CHARDRIVER
#
##############################################################

AESD_CHARDRIVER_VERSION = '6bc7193aa798769ee4d51fe74c3dcb511122a162'
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
