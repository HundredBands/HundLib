local Window = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function Window:New()
    local Window = {}

    Window.Object = Lofi.require("Lofi\\Base Objects\\Window.lua")()
    Window.Object.Parent = game.CoreGui

    Window.Tiles = 1

    function Window:Tile(icon, label)
        local Tile = Lofi.require("Lofi\\Tile.lua"):New(icon, label, Window)
    
        return Tile
    end

    return Window
end

return Window