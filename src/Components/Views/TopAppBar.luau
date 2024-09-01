--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children

local Types = require(Components.Types)
type TopAppBar = Types.TopAppBar

local function TopAppBar(
	scope: Types.ComponentScope,
	props: Types.Properties
): TopAppBar

	return scope:New 'Frame' {
		Name = 'TopAppBar',
		
		BackgroundColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314),
		ZIndex = props.ZIndex or 1,

		Size = UDim2.new(1, 0, 0, 50)
    } :: TopAppBar
end

return TopAppBar