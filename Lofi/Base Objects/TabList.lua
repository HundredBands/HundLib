local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "Frame";
	Properties = {
		Name = "TabList";
		Position = UDim2.new(0,25,0,25);
		BorderColor3 = Color3.new(14/85,14/85,14/85);
		Size = UDim2.new(0,350,0,30);
		BorderSizePixel = 0;
		BackgroundColor3 = Color3.new(10/51,10/51,10/51);
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