return false --[[
-- Global
console = {} -- console module

-- Local
local mconsole = {} -- console metatable

-- Function
function console.log(...)
    local out = ''
    for i, v in next, {...} do
        out = out .. tostring(v) .. ' '
    end
    rconsoleprint(out)
    return nil
end
console.colors_raw = {
    'Black', 'Blue', 'Green', 'Cyan', 'Red', 'Magenta', 'Brown', 
    'Light Gray', 'Dark Gray', 'Light Blue', 'Light Green', 'Light Cyan', 
    'Light Red', 'Light Magenta', 'Yellow', 'White'
}
console.colors = {}
for i, col in next, console.colors_raw do
    console.colors[col:lower()] = ('@@%s@@'):format(col:lower():gsub(' ', '_'))
end

function console.clog(color, ...)
    local out = ''
    for i, v in next, {...} do
        out = out .. tostring(v) .. ' '
    end
    rconsoleprint(console.colors[color:lower() or 'white'])
    rconsoleprint(out)
    return nil
end

--// Set metatables
console = setmetatable(console, mconsole)

--// Finishing
return console]]