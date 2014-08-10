--[[ 模块入口 ]]

-- 程序模块名	/usr/lib/lua/luci/controller/njitclient.lua
module("luci.controller.njitclient", package.seeall)

function index()
	-- 添加一个新的模块(Page)入口
	-- entry(路径, 调用目标, _("显示名称"), 显示顺序)
	-- 路径 以字符串数组给定 {"admin", "network", "njitclient"} -> http://ip/cgi-bin/luci/admin/network/njitclient
	-- 调用目标：
		-- 执行指定方法（Action）：call("function_name")
		-- 访问指定页面（Views）：template("myapp/mymodule")	访问/usr/lib/lua/luci/view/myapp/mymodule.htm
		-- 调用CBI(Configuration Binding Interface) Module：cbi("myapp/mymodule")	调用/usr/lib/lua/luci/model/cbi/myapp/mymodule.lua
		-- 重定向：alias("admin", "status", "overview")
	entry({"admin", "network", "njitclient"}, cbi("njitclient"), _("NJIT Client"), 100)
	end