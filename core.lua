getgenv().core = {}
local core = getgenv().core
function core:gHttp(url, default)
    local default = default or nil
    local success, ret = pcall(function()
        return game:HttpGet(url)
    end)
    if not success then return default end
    return ret
end
function core:gModule(name)
    local module_url = ('https://raw.githubusercontent.com/brownfieldd00/%s.lua'):format(name)
    local module = self:gHttp(module_url, false)
    return module
end



return getgenv().core