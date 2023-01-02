--[[
    Project:
    Name: debug
    Author: brownfieldd00
    URL: x
]]
core = core or loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))() -- load core incase its not there
local function output(s)
    rconsoleprint(s .. '\n')
end
output("brownfieldd00's debug initializing...")
if not game:IsLoaded() then
    output('Game is not loaded. Waiting...')
    repeat task.wait() until game:IsLoaded()
end
rconsoleprint([[Game loaded.]] .. '\n')
local debug = {}
if not syn then return nil end
rconsoleprint('@@BLUE@@')
rconsoleprint([[Getting services...]] .. '\n')
--// Services
local Players = game:GetService('Players')
local VIM = game:GetService('VirtualInputManager')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local HttpService = game:GetService('HttpService')
rconsoleprint([[Defining functions...]] ..'\n')
--// Functions
function debug:getLocalPlayer()
    return Players.LocalPlayer
end
function debug:print(...)
    local args = {...}
    for i, v in pairs(args) do
        rconsoleprint(tostring(v))
        rconsoleprint(' ')
    end
end

--// Set metatables
--console = setmetatable(console, mconsole)

--// Finishing
rconsoleprint('@@GREEN@@')
rconsoleprint([[debug ready!]] .. '\n')
rconsoleprint('@@WHITE@@')
return debug