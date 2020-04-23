local TweenService = game:GetService("TweenService")

function Animate(object, Dropdown)
    object.MouseEnter:Connect(function()
        TweenService:Create( object, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(58, 58, 58)
        } ):Play()
    end)
    
    object.MouseLeave:Connect(function()
        TweenService:Create( object, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(26, 26, 26)
        } ):Play()
    end)
    object.MouseButton1Click:Connect(function()
        if object.Label.Text == Dropdown.Value then return end
        for index, object in next, Dropdown.Object.Options:GetChildren() do
            if object.ClassName == "TextButton" then 
                TweenService:Create( object.Label, TweenInfo.new(0.3), {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                } ):Play()
            end
        end
        TweenService:Create( object.Label, TweenInfo.new(0.3), {
            TextColor3 = Color3.fromRGB(255, 0, 127)
        } ):Play()
        Dropdown.Object.Value.Text = object.Label.Text
        Dropdown.Value = object.Label.Text
        Dropdown.Callback(object.Label.Text)
    end)
end

return Animate