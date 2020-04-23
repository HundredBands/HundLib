local Slider = {}

function Slider:New(label, options, callback, Groupbox)
    local Slider = {
        min = options.min or 0,
        max = options.max or 100,
        Callback = callback
    }
    Slider.default = options.default or Slider.min
    Slider.Value = Slider.default
    
    Slider.Object = Lofi.require("Lofi\\Base Objects\\Slider.lua")()
    Slider.Object.Parent = Groupbox.Object
    Slider.Object.Label.Text = label
    Slider.Object.Value.Text = Slider.default
    Slider.Object.Position = UDim2.new(0, 0, 0, Groupbox.NextPosition)

    Groupbox.NextPosition = Groupbox.NextPosition + Slider.Object.AbsoluteSize.Y

    Lofi.require("Lofi\\Animations\\Slider.lua")(Slider)

    return Slider
end

return Slider