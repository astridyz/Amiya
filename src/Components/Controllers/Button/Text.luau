--!strict
local Components = script.Parent.Parent.Parent
local Amiya = Components.Parent

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children

local Button = require(script.Parent)

local Types = require(Components.Types)
type TextButton = Types.AmiyaTextButton
type UsedAs<T> = Fusion.UsedAs<T>

local function TextButton(
    scope: Types.ComponentScope,
    props: Types.TextButtonProps & Types.Properties<{
        Text: UsedAs<string>?,
    }>
): TextButton

    return Button(scope, {
        Size = props.Size,
        LayoutOrder = props.LayoutOrder,
        OnClick = props.OnClick,

        [Children] = {
            Text = scope:New 'TextLabel' {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),

                Text = props.Text or 'Info',
                TextSize = 16,
                Font = Enum.Font.GothamMedium,
            },

            (props :: any)[Children],
        },
    })
end

return TextButton
