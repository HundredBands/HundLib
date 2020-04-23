local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()

function Animate(Slider)
    local SliderItem = Slider.Object
    local SliderBG = SliderItem.SliderBG
    local Value = SliderItem.Value

    local IsHeld = false
    local Last = 0

    local Step = (SliderBG.AbsoluteSize.X / (Slider.max - Slider.min))
    if Slider.default == Slider.min then
        SliderItem.Slider.Size = UDim2.new(0, Step*(Slider.default - Slider.min), 0, 10)
    else
        SliderItem.Slider.Size = UDim2.new(0, Step*(Slider.default - Slider.min)+Step*0.5, 0, 10)
    end
    
    SliderItem.MouseEnter:Connect(function()
        TweenService:Create( SliderBG, TweenInfo.new(0.2), {
            ImageColor3 = Color3.fromRGB(42, 42, 42)
        } ):Play()
    end)
    
    SliderItem.MouseLeave:Connect(function()
        TweenService:Create( SliderBG, TweenInfo.new(0.2), {
            ImageColor3 = Color3.fromRGB(26, 26, 26)
        } ):Play()
    end)
    
    SliderItem.MouseButton1Down:Connect(function()
        IsHeld = true
        TweenService:Create( Value, TweenInfo.new(0.3), {
            TextColor3 = Color3.fromRGB(255, 255, 255)
        } ):Play()
    end)
    
    SliderItem.MouseButton1Up:Connect(function()
        IsHeld = false
        TweenService:Create( Value, TweenInfo.new(0.3), {
            TextColor3 = Color3.fromRGB(161, 161, 161)
        } ):Play()
    end)
    
    Mouse.Button1Up:Connect(function()
        IsHeld = false
        TweenService:Create( Value, TweenInfo.new(0.3), {
            TextColor3 = Color3.fromRGB(161, 161, 161)
        } ):Play()
    end)
    
    RunService:BindToRenderStep("Slider", 1, function()
        if not IsHeld then return end
        if IsHeld and not game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then 
            IsHeld = false
            TweenService:Create( Value, TweenInfo.new(0.3), {
                TextColor3 = Color3.fromRGB(161, 161, 161)
            } ):Play()
            return
        end
        local Position = SliderBG.AbsolutePosition.X
        local Size = Mouse.X - Position
        Size = math.floor(math.clamp(Size, 0, SliderBG.AbsoluteSize.X))
        local FinalValue = Slider.min + ((Slider.max - Slider.min) / SliderBG.AbsoluteSize.X)*Size
        TweenService:Create( SliderItem.Slider, TweenInfo.new(0.1), {
            Size = UDim2.new(0, Size, 0, 10)
        } ):Play()
        Value.Text = math.floor(FinalValue)
        if FinalValue ~= Last then
            Slider.Callback(FinalValue)
            Slider.Value = FinalValue
            Last = Size
        end
    end)
end

return Animate