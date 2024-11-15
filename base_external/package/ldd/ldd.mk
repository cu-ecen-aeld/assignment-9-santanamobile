##############################################################
#
# LDD-BASE
#
##############################################################
# Commit hash
LDD_VERSION = 'cfa3cab310f98fbf63cea08fdace39b6a1f47674'
# Repository
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-santanamobile.git'
LDD_SITE_METHOD = git

LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull misc-modules
LDD_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
