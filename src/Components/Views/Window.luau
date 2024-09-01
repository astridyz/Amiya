--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent
local Assets = require(Amiya.Modules.Assets)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children

local Types = require(Components.Types)
type Window<D = Instance> = Types.Window<D>

local function Window(
	scope: Types.ComponentScope,
	props: Types.Properties
): Window

	return scope:New 'Frame' {
		Name = 'Window',
		Visible = props.Visible or true,
		ZIndex = props.ZIndex or 1,

		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		Size = props.Size or UDim2.fromOffset(600, 600),

		BackgroundTransparency = 1,

		[Children] = {
			scope:New 'ImageLabel' {
				Name = 'Body',
				
				BackgroundTransparency = 1,
				Image = Assets.Components.Background,
				Size = UDim2.fromScale(1, 1),
				ImageColor3 = Color3.new(0.101961, 0.101961, 0.101961),
				
				[Children] = (props :: {})[Children]
			},
			
			scope:New 'ImageLabel' {
				Name = 'Border',

				BackgroundTransparency = 1,
				Image = Assets.Components.BgEffects,
				Size = UDim2.fromScale(1, 1),
				ImageColor3 = Color3.new(1, 1, 1)
			},

			scope:New 'UIAspectRatioConstraint' {
				AspectRatio = 1.5,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Width,
			}
		}
	} :: Window
end

return Window