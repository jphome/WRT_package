PO = demo_language

include $(TOPDIR)/rules.mk

## 软件包名称，将在menuconfig和ipkg可以看到
PKG_NAME:=luci-app-demo
## 软件版本号
PKG_VERSION=1.0
## Makefile的版本号
PKG_RELEASE:=1
## 软件维护者
PKG_MAINTAINER:=JPH <jphome98@163.com>
## 源代码的文件名
# PKG_SOURCE
## 源代码的下载网站位置
# PKG_SOURCE_URL
# 获取代码方式可以为git、svn、cvs、hg、bzr等
# 下载方法参考$(INCLUDE_DIR)/download.mk 和 $(SCRIPT_DIR)/download.pl
#	@SF		sourceforge网站
#	@GNU	GNU网站
#	@GNOME
#	@KERNEL
## 源代码文件的效验码
# PKG_MD5SUM
## 源代码文件的解压方法
# PKG_CAT

## 软件包编译目录 [默认为$(BUILD_DIR)/$( PKG_NAME)$( PKG_VERSION)]
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

## 编译包 定义
define Package/$(PKG_NAME)
	# 包的类型
	SECTION:=luci
	# 分类, 在menuconfig的菜单下将可以找到
	CATEGORY:=LuCI
	# 子分类 对应menuconfig中/LuCI/3. Applications/luci-app-njitclient
	SUBMENU:=3. Applications
	# 软件包的简短描述
	TITLE:=Demo for LuCI
	# control中的 Architecture 字段, 默认为当前编译器的交叉编译环境平台
	PKGARCH:=all
	# URL 				软件包的下载地址
	# MAINTAINER		维护者
	# DEPENDS 			与其他软件的依赖, 即如编译或安装需要其他软件时需要说明 DEPENDS:=+libmath +libzlib
endef

## 软件包的详细描述, control中的 Description 字段, 默认为TITLE
define Package/$(PKG_NAME)/description
	This package contains LuCI configuration pages for Demo.
endef

## 编译准备 创建文件夹、拷贝源文件
define Build/Prepare
endef

## 针对需要配置的软件包 Automake中./configure
define Build/Configure
endef

## 编译方法 没特殊说明不定义 使用默认编译方法
# $(MAKE) -C $(PKG_BUILD_DIR) \
# 	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
define Build/Compile
endef

## 软件包的安装方法		$(1) -> 嵌入系统的镜像目录 /
define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/config
	# $(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view
	
	$(INSTALL_CONF) ./files/root/etc/config/demo $(1)/etc/config/demo
	# $(INSTALL_BIN) ./files/root/etc/init.d/njitclient $(1)/etc/init.d/njitclient
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/model/cbi/demo.lua $(1)/usr/lib/lua/luci/model/cbi/demo.lua
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/controller/demo.lua $(1)/usr/lib/lua/luci/controller/demo.lua
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/view/demo.htm $(1)/usr/lib/lua/luci/view/demo.htm
endef

## 软件包安装前处理方法, 使用脚本语言
define Package/$(PKG_NAME)/preinst
	#!/bin/sh
	echo "###$(PKG_MAINTAINER): To install $(PKG_NAME)"
endef

## 软件包安装后处理方法, 使用脚本语言
define Package/$(PKG_NAME)/postinst
	#!/bin/sh
	echo "###$(PKG_MAINTAINER): $(PKG_NAME) install succeed"
endef

## 软件包删除前处理方法, 使用脚本语言
define Package/$(PKG_NAME)/prerm
	#!/bin/sh
	echo "###$(PKG_MAINTAINER): To remove $(PKG_NAME)"
endef

## 软件包删除后处理方法, 使用脚本语言
define Package/$(PKG_NAME)/postrm
	#!/bin/sh
	echo "###$(PKG_MAINTAINER): $(PKG_NAME) remove succeed"
endef

## 使用eval函数实现各种定义
$(eval $(call BuildPackage,$(PKG_NAME)))
