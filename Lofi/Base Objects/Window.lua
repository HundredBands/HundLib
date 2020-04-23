local partsWithId = {}
local awaitRef = {}

local root = {
	ID = 0;
	Type = "ScreenGui";
	Properties = {
		Name = "Lofi";
	};
	Children = {
		{
			ID = 1;
			Type = "Frame";
			Properties = {
				Name = "Container";
				ClipsDescendants = true;
				BorderColor3 = Color3.new(1,0,127/255);
				Position = UDim2.new(0.36206895112991,0,0.25429975986481,0);
				Size = UDim2.new(0,400,0,400);
				BackgroundColor3 = Color3.new(14/85,14/85,14/85);
			};
			Children = {
				{
					ID = 2;
					Type = "Frame";
					Properties = {
						Name = "Content";
						Position = UDim2.new(1,0,0,0);
						BorderColor3 = Color3.new(1,0,127/255);
						Size = UDim2.new(0,400,0,400);
						BorderSizePixel = 0;
						BackgroundColor3 = Color3.new(14/85,14/85,14/85);
					};
					Children = {};
				};
				{
					ID = 3;
					Type = "Frame";
					Properties = {
						Name = "Main";
						Position = UDim2.new(0.5,-200,0.5,-200);
						BorderColor3 = Color3.new(1,0,127/255);
						Size = UDim2.new(0,400,0,400);
						BorderSizePixel = 0;
						BackgroundColor3 = Color3.new(14/85,14/85,14/85);
					};
					Children = {};
				};
				{
					ID = 4;
					Type = "Frame";
					Properties = {
						Name = "Overlay";
						Position = UDim2.new(1,0,0,0);
						Size = UDim2.new(1,0,1,0);
						ZIndex = 2;
						BorderSizePixel = 0;
						BackgroundColor3 = Color3.new(14/85,14/85,14/85);
					};
					Children = {};
				};
			};
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