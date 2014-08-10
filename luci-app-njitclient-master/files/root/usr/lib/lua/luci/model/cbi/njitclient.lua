--[[ 配置模块实际的代码 ]]

--[[
LuCI - Lua Configuration Interface

Copyright 2010 Jo-Philipp Wich <xm@subsignal.org>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0
]]--

require("luci.sys")

-- 映射与存储文件的关系
-- m = Map("配置文件文件名", "配置页面标题", "配置页面说明")
	-- 配置文件文件名：配置文件存储的文件名，不包含路径 /etc/config/xxx
m = Map("njitclient", translate("NJIT Client"), translate("Configure NJIT 802.11x client."))

-- 配置文件中对应的section
s = m:section(TypedSection, "login", "")
-- 不允许增加或删除
s.addremove = false
-- 不显示Section的名称
s.anonymous = true

-- 配置文件中section的交互(创建Option)
	-- Value（文本框）
	-- ListValue（下拉框）
	-- Flag（选择框）
enable = s:option(Flag, "enable", translate("Enable"))
name = s:option(Value, "username", translate("Username"))
pass = s:option(Value, "password", translate("Password"))
pass.password = true
domain = s:option(Value, "domain", translate("Domain"))

ifname = s:option(ListValue, "ifname", translate("Interfaces"))
for k, v in ipairs(luci.sys.net.devices()) do
	if v ~= "lo" then
		ifname:value(v)
	end
end

-- 判断是否点击了“应用”按钮
local apply = luci.http.formvalue("cbi.apply")
if apply then
	io.popen("/etc/init.d/njitclient restart")
end

return m
