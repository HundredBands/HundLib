local Groupbox = {}

function Groupbox:New(position, size, label, Tile)
    local Groupbox = {
        NextPosition = 10
    }
    Groupbox.Object = Lofi.require("Lofi\\Base Objects\\Groupbox.lua")()

    Groupbox.Object.Parent = Tile.Content
    Groupbox.Object.Title.Text = label
    Groupbox.Object.Size = size
    Groupbox.Object.Position = position

    function Groupbox:Checkbox(label, callback)
        local Checkbox = Lofi.require("Lofi\\Checkbox.lua"):New(label, callback, Groupbox)

        return Checkbox
    end

    function Groupbox:Button(label, callback)
        local Checkbox = Lofi.require("Lofi\\Button.lua"):New(label, callback, Groupbox)

        return Checkbox
    end

    function Groupbox:Slider(label, options, callback)
        local Checkbox = Lofi.require("Lofi\\Slider.lua"):New(label, options, callback, Groupbox)

        return Checkbox
    end

    function Groupbox:Dropdown(label, options, callback)
        local Dropdown = Lofi.require("Lofi\\Dropdown.lua"):New(label, options, callback, Groupbox)

        return Dropdown
    end

    return Groupbox
end

return Groupbox