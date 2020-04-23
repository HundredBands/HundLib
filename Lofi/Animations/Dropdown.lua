local TweenService = game:GetService("TweenService")

function Animate(Dropdown)
    local Background = Dropdown.Object.Background
    local Options = Dropdown.Object.Options

    Dropdown.Object.MouseEnter:Connect(function()
        TweenService:Create( Background, TweenInfo.new(0.3), {
            ImageColor3 = Color3.fromRGB(58, 58, 58)
        } ):Play()
    end)

    Dropdown.Object.MouseLeave:Connect(function()
        TweenService:Create( Background, TweenInfo.new(0.3), {
            ImageColor3 = Color3.fromRGB(26, 26, 26)
        } ):Play()
    end)

    Dropdown.Object.MouseButton1Click:Connect(function()
        Options.Visible = true
        if Dropdown.IsOpen then
            TweenService:Create( Options, TweenInfo.new(0.3), {
                Size = UDim2.new(1, -30, 0, 0)
            } ):Play()
        else
            TweenService:Create( Options, TweenInfo.new(0.3), {
                Size = UDim2.new(1, -30, 0, Options.UIListLayout.AbsoluteContentSize.Y)
            } ):Play()
        end
        Dropdown.IsOpen = not Dropdown.IsOpen
    end)
end

return Animate