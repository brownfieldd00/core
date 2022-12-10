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
    local module_url = ('https://raw.githubusercontent.com/brownfieldd00/Roblox/main/Modules/%s.lua'):format(name)
    local module = self:gHttp(module_url, false)
    return loadstring(module)()
end
function core:gPlayer(name)
    local players = game:GetService('Players')
    if name then
        for i, v in pairs(players:GetPlayers()) do
            if v.Name:lower():sub(1, #name) == name:lower() then
                return v
            end
        end
        return nil
    end
    return players.LocalPlayer
end
function core:notify(title, text, duration)
    if not title then return end
    local text = text or ''
    local duration = duration or 3
	game:GetService("StarterGui"):SetCore("SendNotification", { Title = title, Text = text, Duration = duration })
	return true
end
function core:cTween(object, properties, duration)
    local duration = duration or 1
    local tweenService = game:GetService('TweenService')
    local tween = tweenService:Create(object, TweenInfo.new(duration), properties)
    tween:Play()
    return true
end
core.Events = {}
function core:bindEvent(name, event, callback)
    self.Events[name] = event:Connect(callback)
    return self.Events[name]
end
return getgenv().core