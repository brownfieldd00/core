local core = {}
core.__index = core
core.Modules = {}

function core:awaitGameReady()
    if not game:IsLoaded() then game.Loaded:Wait() end
    return true
end

function core:httpG(url)
    return syn.request({Url = url, Method = 'GET'}).Body
end

function core:createUserdata(t, mt)
	local proxy = newproxy(mt and true or false)
	local meta = getmetatable(proxy)
	meta.__index = t
	meta.__address = tostring(proxy)
	function t:getAddress()
		return meta.__address
	end
    function t:getTable()
        return meta ^ 1
    end
	if mt then
		for k, v in next, mt do
			if k == 'onNewIndex' then
				meta.__newindex = v
			elseif k == 'onIndex' then
				meta.__index = v
			elseif k == 'onLengthGet' then
				meta.__len = v
			elseif k == 'onCall' then
				meta.__call = v
			elseif k == '__pow' then
				continue -- should not overwrite this function
			else
				meta[k] = v
			end
		end
	end
	t.setItem = function(userdata, k, v)
		local main_table = userdata ^ 1 -- this will call __pow in the metatable
		return rawset(main_table, k, v)
	end

	-- Set important stuff
	meta.__pow = function(this_proxy, pow) if pow == 1 then return t else return 0 end end -- doing proxy ^ 1 will return the table
	self.userdatas[meta.__address] = proxy -- add the proxy to the userdatas table
	return proxy
end

return core