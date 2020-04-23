local TweenService = game:GetService("TweenService")

function Animate(Button)
    Button.Object.MouseEnter:Connect(function()
        TweenService:Create( Button.Object.Box, TweenInfo.new(0.3), {
            ImageColor3 = Color3.fromRGB(58, 58, 58)
        } ):Play()
    end)
    
    Button.Object.MouseLeave:Connect(function()
        TweenService:Create( Button.Object.Box, TweenInfo.new(0.3), {
            ImageColor3 = Color3.fromRGB(26, 26, 26)
        } ):Play()
    end)
    
    Button.Object.MouseButton1Click:Connect(Button.Callback)
end

return Animate