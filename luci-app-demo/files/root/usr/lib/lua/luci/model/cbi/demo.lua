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
m = Map("demo", translate("Demo Client"), translate("Configure demo client."))

-- 对应/etc/config/demo
-- config login
-- 	option username ''
-- 	option password ''
-- 	option ifname 'eth0'
-- 	option domain ''

-- 配置文件中对应的section
sec_1 = m:section(TypedSection, "login", "")
-- 不允许增加或删除
sec_1.addremove = false
-- 不显示Section的名称
sec_1.anonymous = true

-- 配置文件中section的交互(创建Option)
	-- Value（文本框）
	-- ListValue（下拉框）
	-- Flag（选择框）
enable = sec_1:option(Flag, "enable", translate("Enable"))
name = sec_1:option(Value, "username", translate("Username"))
name.default = "xxx"
pass = sec_1:option(Value, "password", translate("Password"))
pass.password = true
pass.default = "xxx"
domainname = sec_1:option(Value, "domainname", translate("Domainname"))
domainname.default = "jphome.github.com"

ifname = sec_1:option(ListValue, "ifname", translate("Interfaces"))
for k, v in ipairs(luci.sys.net.devices()) do
	if v ~= "lo" then
		ifname:value(v)
	end
end

sec_2 = m:section(TypedSection, "demo_list", translate("Config demo_list"), translate("The options below are all of demo's arguments."))
sec_2.anonymous = true
ip_list = sec_2:option(ListValue, "ip_list", translate("ip_list"), translate("default to 192.168.1.1"))
ip_list.anonymous = true
ip_list:value("192.168.1.0", translate("0(ip_1)"))
ip_list:value("192.168.1.1", translate("1(ip_2)"))
ip_list.default = "192.168.1.1"

-- 判断是否点击了“应用”按钮
local apply = luci.http.formvalue("cbi.apply")
if apply then
	-- io.popen("/etc/init.d/njitclient restart")
end

return m
