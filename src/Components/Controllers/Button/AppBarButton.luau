--!strict
local Components = script.Parent.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Assets = require(Modules.Assets)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children

local Button = require(script.Parent)

local Types = require(Components.Types)
type AppBarButton = Types.AppBarButton

local function AppBarButton(
    scope: Types.ComponentScope,
    props: Types.Properties<{
        Icon: string?,
        Size: Fusion.UsedAs<UDim2>,
        LayoutOrder: Fusion.UsedAs<number>?,
        OnClick: () -> ()?,
    }>
): AppBarButton

    return Button(
        scope,
        {
            Size = UDim2.fromOffset(60, 50),

            [Children] = {
                Icon = scope:New 'ImageLabel' {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.8, 0.8),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),

                    Image = props.Icon or Assets.Icons.Info,
                    ImageColor3 = Color3.new(0, 0, 0),
                    ScaleType = Enum.ScaleType.Fit,
                },
            },
        } :: any
    ) :: AppBarButton
end

return AppBarButton
