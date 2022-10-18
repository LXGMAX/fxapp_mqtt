#
# This software is licensed under the Public Domain.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fxapp
PKG_VERSION:=1.0.0
PKG_RELEASE:=$(AUTORELEASE)

PKG_MAINTAINER:=lxgmax <leickwell@hotmail.com>
PKG_LICENSE:=GPLv3

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/fxapp
	SECTION:=utils
	# Select package by default
	#DEFAULT:=y
	CATEGORY:=Utilities
	TITLE:=A mqtt subscribe application.
	DEPENDS:= +libmosquitto
	URL:=https://gzjnas.xyz
endef

define Package/fxapp/description
	This is fxapp.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/fxapp/install
	$(CP) ./files/* $(1)/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/fxapp $(1)/usr/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
