--[[ 配置模块实际的代码 ]]

--[[
LuCI - Lua Configuration Interface

Copyright 2010 Jo-Philipp Wich <xm@subsignal.org>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0
]]--

require("os")
require("luci.sys")
local uci = require "luci.model.uci".cursor()

-- 映射与存储文件的关系
-- m = Map("配置文件文件名", "配置页面标题", "配置页面说明")
	-- 配置文件文件名：配置文件存储的文件名，不包含路径 /etc/config/xxx
m = Map("hik_sniffer", translate("Hikvision IPC"), translate("Device List"))

-- 对应/etc/config/demo
-- config login
-- 	option username ''
-- 	option password ''
-- 	option ifname 'eth0'
-- 	option domain ''


sec = m:section(TypedSection, "ipc", translate("IPC"))
ipc_list = sec:option(ListValue, "ipaddr", translate("IPC"), translate("发现的hikvision设备ip"))
for key, val in pairs(uci:get_list("hik_sniffer", "ipc_list", "ipaddr")) do
	ipc_list:value(val)
end


return m
