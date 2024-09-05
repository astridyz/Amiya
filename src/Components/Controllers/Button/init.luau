--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent

local Types = require(Components.Types)
type Button = Types.Button
type UsedAs<T> = Fusion.UsedAs<T>

local function Button(
    scope: Types.ComponentScope,
    props: Types.Properties<{
        Size: UsedAs<UDim2>?,
        LayoutOrder: UsedAs<number>?,
        OnClick: () -> ()?,
        AnchorPoint: Vector2?,
        Position: UsedAs<UDim2>?,
    }>
): Button

    return scope:New 'TextButton' {
        Name = 'Button',
        BackgroundTransparency = 1,
        Size = props.Size or UDim2.fromOffset(200, 50),
        ZIndex = props.ZIndex,
        LayoutOrder = props.LayoutOrder,

        AnchorPoint = props.AnchorPoint or Vector2.new(0, 0),
        Position = props.Position or UDim2.fromScale(0, 0),

        [OnEvent 'InputEnded'] = function(input)
            if table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }, input.UserInputType) then
                if props.OnClick then
                    props.OnClick()
                end
            end
        end,

        [Children] = (props :: {})[Children],
    } :: Button
end

return Button
