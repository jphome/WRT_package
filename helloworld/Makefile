include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

PKG_NAME:=helloworld
# Version: 1.0-1
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_MAINTAINER:=JPH <jphome98@163.com>
# PKG_SOURCE_URL:=

define Package/$(PKG_NAME)
	SECTION:=utils
	CATEGORY:=Utilities
	DEFAULT:=y
	TITLE:=Helloworld -- prints a snarky message
	# DEPENDS:=+libmath		# 默认libc
endef

define Build/Prepare
	@echo "############## Build/Prepare"
	$(Build/Prepare/Default)
	$(CP) ./src/* $(PKG_BUILD_DIR)	
endef

define Package/$(PKG_NAME)/install
	@echo "############## Package/helloworld/install"
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/helloworld $(1)/usr/bin
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

