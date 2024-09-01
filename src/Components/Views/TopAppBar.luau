--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Scheme = require(Modules.Schemes.Default)

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
		
		BackgroundColor3 = Scheme.Color.Header,
		ZIndex = props.ZIndex or 1,
		Size = UDim2.new(1.2, 0, 0.08, 0),
		Position = UDim2.fromScale(-0.1, 0),
		
		[Children] = {
			deriveScope:New 'Frame' {
				Name = 'Buttons',
				
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				
				[Children] = {
					deriveScope:New 'UIListLayout' {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
					},

                    (props :: {})[Children]
				}
			},
			
			deriveScope:New 'UICorner' {}
		}
    } :: TopAppBar
end

return TopAppBar