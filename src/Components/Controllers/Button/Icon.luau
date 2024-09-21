--!strict
local Components = script.Parent.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Assets = require(Modules.Assets)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children

local Button = require(script.Parent)

local Types = require(Components.Types)
type IconButton = Types.IconButton

local function IconButton(
    scope: Types.ComponentScope,
    props: Types.IconButtonProps & Types.Properties<{
        BackgroundColor3: Color3?,
        BackgroundTransparency: number?,
        IconColor3: Color3?
    }>
): IconButton

    return Button(scope, {
        Size = props.Size or UDim2.fromOffset(40, 40),
        LayoutOrder = props.LayoutOrder,
        OnClick = props.OnClick,
        BackgroundColor3 = props.BackgroundColor3,
        BackgroundTransparency = props.BackgroundTransparency,

        [Children] = {
            Icon = scope:New 'ImageLabel' {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7, 0.7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),

                Image = props.Icon or Assets.Icons.Info,
                ImageColor3 = props.IconColor3 or Color3.new(),
                ScaleType = Enum.ScaleType.Fit,
            },

            scope:New 'UIAspectRatioConstraint' {
                AspectRatio = 1,
            },

            (props :: any)[Children],
        },
    })
end

return IconButton
