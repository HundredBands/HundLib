local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
function Animate(Tile, Window)
    local Container = Window.Object.Container
    local Center = UDim2.new(0, 38, 0, 38)
    local LabelCenter = UDim2.new(0, 0, 1, -38)
    Tile.Object.MouseEnter:Connect(function()
        TweenService:Create( Tile.Object.Icon, TweenInfo.new(0.3), {
            Position = Center - UDim2.new(0, 0, 0, 15),
            TextColor3 = Color3.fromRGB(255, 0, 127)
        } ):Play()
        TweenService:Create( Tile.Object.Label, TweenInfo.new(0.3), {
            Position = LabelCenter - UDim2.new(0, 0, 0, 10),
            TextColor3 = Color3.fromRGB(255, 0, 127)
        } ):Play()
    end)
    
    Tile.Object.MouseLeave:Connect(function()
        TweenService:Create( Tile.Object.Icon, TweenInfo.new(0.3), {
            Position = Center,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        } ):Play()
        TweenService:Create( Tile.Object.Label, TweenInfo.new(0.3), {
            Position = LabelCenter,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        } ):Play()
    end)
    
    Tile.Object.MouseButton1Down:Connect(function()
        TweenService:Create( Container.Main, TweenInfo.new(0.7), {
            Position = UDim2.new(-1, 0, 0, 0)
        } ):Play()
        TweenService:Create( Container.Content, TweenInfo.new(0.7), {
            Position = UDim2.new(0, 0, 0, 0)
        } ):Play()
        for index, object in next, Container.Content:GetChildren() do
            object.Visible = false
        end
        Container.Content[Tile.Object.Name].Visible = true
        TweenService:Create( Container.Overlay, TweenInfo.new(0.7), {
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 0)
        } ):Play()
    end)
    
    --/**/ Return Keybind \**\--
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Backspace then
            TweenService:Create( Container.Main, TweenInfo.new(0.7), {
                Position = UDim2.new(0, 0, 0, 0)
            } ):Play()
            TweenService:Create( Container.Overlay, TweenInfo.new(0.7), {
                BackgroundTransparency = 0,
                Position = UDim2.new(1, 0, 0, 0)
            } ):Play()
            TweenService:Create( Container.Content, TweenInfo.new(0.7), {
                Position = UDim2.new(1, 0, 0, 0)
            } ):Play()
        end
    end)
end

return Animate