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
        Size: Fusion.UsedAs<UDim2>?,
        LayoutOrder: Fusion.UsedAs<number>?,
        OnClick: () -> ()?,
    }>
): AppBarButton

    return Button(
        scope,
        {
            Size = props.Size or UDim2.fromOffset(30, 30),
            LayoutOrder = props.LayoutOrder,
            OnClick = props.OnClick,
    
            [Children] = {
                Icon = scope:New 'ImageLabel' {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.7, 0.7),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
    
                    Image = props.Icon or Assets.Icons.Info,
                    ImageColor3 = Color3.new(0, 0, 0),
                    ScaleType = Enum.ScaleType.Fit,
                },
    
                (props :: any)[Children],
            },
        }
    ) :: AppBarButton
end

return AppBarButton
