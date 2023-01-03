foreach = function(list, callback)
    for i, v in next, list do
        callback(i, v)
    end
end
click = function(button)
    if button:IsA('TextButton') or button:IsA('ImageButton') then
        firesignal(button.MouseButton1Click, {})
        firesignal(button.MouseButton1Down, {})
        firesignal(button.MouseButton1Down, {})
    end
end

-- foreach
forEach = foreach
applyEach = foreach
applyAll = foreach

-- click
uiclick = click
clickbutton = click
clickimagebutton = click
clicktextbutton = click