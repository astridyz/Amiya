--!strict
local Components = script.Parent.Parent.Parent

local IconButton = require(script.Parent.Icon)

local Types = require(Components.Types)
type AppBarButton = Types.AppBarButton

local function AppBarButton(
    scope: Types.ComponentScope,
    props: Types.IconButtonProps
): AppBarButton

    return IconButton(scope, {
        Size = props.Size or UDim2.fromOffset(30, 30),
        LayoutOrder = props.LayoutOrder,
        OnClick = props.OnClick,
        Icon = props.Icon,
        BackgroundTransparency = 1,
    })
end

return AppBarButton
