local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "TextButton";
	Properties = {
		FontSize = Enum.FontSize.Size14;
		ClipsDescendants = true;
		BorderColor3 = Color3.new(14/85,14/85,14/85);
		Text = "";
		AutoButtonColor = false;
		TextColor3 = Color3.new(0,0,0);
		Font = Enum.Font.Arial;
		Name = "Title";
		Position = UDim2.new(0.125,0,0.125,0);
		Size = UDim2.new(0,125,0,125);
		TextSize = 14;
		BorderSizePixel = 0;
		BackgroundColor3 = Color3.new(14/85,14/85,14/85);
	};
	Children = {
		{
			ID = 1;
			Type = "TextLabel";
			Properties = {
				FontSize = Enum.FontSize.Size96;
				TextColor3 = Color3.new(1,1,1);
				Text = "T";
				Font = Enum.Font.Gotham;
				Name = "Icon";
				Position = UDim2.new(0,38,0,38);
				BackgroundTransparency = 1;
				Size = UDim2.new(0,48,0,48);
				TextSize = 64;
				BackgroundColor3 = Color3.new(1,1,1);
			};
			Children = {};
		};
		{
			ID = 2;
			Type = "TextLabel";
			Properties = {
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(1,1,1);
				BorderColor3 = Color3.new(14/85,14/85,14/85);
				Text = "Tile";
				Font = Enum.Font.Gotham;
				Name = "Label";
				Position = UDim2.new(0,0,1, -38);
				Size = UDim2.new(0,125,0,18);
				TextSize = 18;
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(14/85,14/85,14/85);
			};
			Children = {};
		};
	};
};

local function Scan(item, parent)
	local obj = Instance.new(item.Type)
	if (item.ID) then
		local awaiting = awaitRef[item.ID]
		if (awaiting) then
			awaiting[1][awaiting[2]] = obj
			awaitRef[item.ID] = nil
		else
			partsWithId[item.ID] = obj
		end
	end
	for p,v in pairs(item.Properties) do
		if (type(v) == "string") then
			local id = tonumber(v:match("^_R:(%w+)_$"))
			if (id) then
				if (partsWithId[id]) then
					v = partsWithId[id]
				else
					awaitRef[id] = {obj, p}
					v = nil
				end
			end
		end
		obj[p] = v
	end
	for _,c in pairs(item.Children) do
		Scan(c, obj)
	end
	obj.Parent = parent
	return obj
end

return function() return Scan(root, nil) end