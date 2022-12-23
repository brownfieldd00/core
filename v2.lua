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

return core