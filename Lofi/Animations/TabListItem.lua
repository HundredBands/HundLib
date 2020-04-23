local TweenService = game:GetService("TweenService")

function Animate(TabListItem, TabList)
    TabListItem.MouseEnter:Connect(function()
        TweenService:Create( TabListItem, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(54, 54, 54)
        } ):Play()
    end)

    TabListItem.MouseLeave:Connect(function()
        TweenService:Create( TabListItem, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        } ):Play()
    end)

    TabListItem.MouseButton1Click:Connect(function()
        if TabList.Value == TabListItem.Text then return end
        for index, object in next, TabList.Object:GetChildren() do
            TweenService:Create( object, TweenInfo.new(0.4), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            } ):Play()
        end
        TweenService:Create( TabListItem, TweenInfo.new(0.4), {
            TextColor3 = Color3.fromRGB(255, 0, 127)
        } ):Play()
        TabList.Callback(TabListItem.Text)
        TabList.Value = TabListItem.Text
    end)
end

return Animate