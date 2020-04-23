local TweenService = game:GetService("TweenService")

function Animate(Checkbox)
    local Box = Checkbox.Object.Box

    Checkbox.Object.MouseEnter:Connect(function()
        if Checkbox.Value then
            TweenService:Create( Box, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(255, 0, 150)
            } ):Play()
        else
            TweenService:Create( Box, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(58, 58, 58)
            } ):Play()
        end
    end)
    
    Checkbox.Object.MouseLeave:Connect(function()
        if Checkbox.Value then
            TweenService:Create( Box, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(255, 0, 127)
            } ):Play()
        else
            TweenService:Create( Box, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(26, 26, 26)
            } ):Play()
        end
    end)
    
    Checkbox.Object.MouseButton1Click:Connect(function()
        Checkbox.Value = not Checkbox.Value
        if Checkbox.Value then
            TweenService:Create( Box, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(255, 0, 127)
            } ):Play()
        else
            TweenService:Create( Box, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(26, 26, 26)
            } ):Play()
        end
        Checkbox.Callback(Checkbox.Value)
    end)
end

return Animate