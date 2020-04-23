local TweenService = game:GetService("TweenService")
local TabList = {}

function TabList:New(position, size, options, callback, Tile)
    local TabList = {
        Value = options[1],
        Callback = callback or function() end
    }
    TabList.Object = Lofi.require("Lofi\\Base Objects\\TabList.lua")()
    TabList.Object.Parent = Tile.Content
    TabList.Object.Position = position
    TabList.Object.Size = size

    local Step = TabList.Object.AbsoluteSize.X / #options
    for index, option in next, options do
        local Option = Lofi.require("Lofi\\Base Objects\\TabListItem.lua")()
        Option.Parent = TabList.Object
        Option.Text = option
        Option.Position = UDim2.new(0, Step*(index-1), 0, 0)
        Option.Size = UDim2.new(0, Step, 1, 0)
        if index ~= 1 then
            Option.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Lofi.require("Lofi\\Animations\\TabListItem.lua")(Option, TabList)
    end

    function TabList:SetOptions(options)
        TabList.Value = options[1]
        local Step = TabList.Object.AbsoluteSize.X / #options
        for index, option in next, options do
            local Option = Lofi.require("Lofi\\Base Objects\\TabListItem.lua")()
            Option.Parent = TabList.Object
            Option.Text = option
            Option.Position = UDim2.new(0, Step*(index-1), 0, 0)
            Option.Size = UDim2.new(0, Step, 1, 0)
            if index ~= 1 then
                Option.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
            Lofi.require("Lofi\\Animations\\TabListItem.lua")(Option, TabList)
        end
    end

    function TabList:SetValue(Value)
        for i,v in next, TabList.Object:GetChildren() do
            if v.Text == Value then
                TabList.Value = Value
                for index, object in next, TabList.Object:GetChildren() do
                    TweenService:Create( object, TweenInfo.new(0.4), {
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    } ):Play()
                end
                TweenService:Create( v, TweenInfo.new(0.4), {
                    TextColor3 = Color3.fromRGB(255, 0, 127)
                } ):Play()
                TabList.Callback(v.Text)
            end
        end
    end

    return TabList
end

return TabList