--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Assets = require(Modules.Assets)
local Scheme = require(Modules.Schemes.Default)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children

local Types = require(Components.Types)
type Window<D = Instance> = Types.Window<D>

local function Window(
	scope: Types.ComponentScope,
	props: Types.Properties<{
		Visible: Fusion.UsedAs<boolean>?,
		Position: UDim2?,
		Size: UDim2?
	}>
): Window
	
	local deriveScope = Fusion.deriveScope(scope) 

	return scope:New 'Frame' {
		Name = 'Window',
		Visible = props.Visible or true,
		ZIndex = props.ZIndex or 1,

		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		Size = props.Size or UDim2.fromOffset(600, 600),

		BackgroundTransparency = 1,

		[Children] = {
			deriveScope:New 'ImageLabel' {
				Name = 'Body',

				BackgroundTransparency = 1,
				Image = Assets.Components.Background,
				Size = UDim2.fromScale(1, 1),
				ImageColor3 = Scheme.Color.Background
			},
			
			deriveScope:New 'ImageLabel' {
				Name = 'Border',

				BackgroundTransparency = 1,
				Image = Assets.Components.BgStroke,
				Size = UDim2.fromScale(1, 1),
				ImageColor3 = Scheme.Color.Header
			},

			deriveScope:New 'UIAspectRatioConstraint' {
				AspectRatio = 2/3,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Width,
			},
			
			(props :: {})[Children]
		}
	} :: Window
end

return Window