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
	
	local deriveScope = Fusion.deriveScope(scope)

	return scope:New 'Frame' {
		Name = 'TopAppBar',
		
		BackgroundColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314),
		ZIndex = props.ZIndex or 1,
		Size = UDim2.new(1, 0, 0, 50),
		
		[Children] = {
			scope:New 'Frame' {
				Name = 'Buttons',
				
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				
				[Children] = {
					deriveScope:New 'UIListLayout' {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
					},

                    (props :: {})[Children]
				}
			}
		}
    } :: TopAppBar
end

return TopAppBar