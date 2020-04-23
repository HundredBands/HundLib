local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "TextButton";
	Properties = {
		FontSize = Enum.FontSize.Size14;
		TextColor3 = Color3.new(1,0,127/255);
		BorderColor3 = Color3.new(58/255,58/255,58/255);
		Text = "TabListItem";
		AutoButtonColor = false;
		Font = Enum.Font.Gotham;
		Name = "TabListItem";
		Size = UDim2.new(0.5,0,1,0);
		TextSize = 14;
		BackgroundColor3 = Color3.new(7/51,7/51,7/51);
	};
	Children = {};
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