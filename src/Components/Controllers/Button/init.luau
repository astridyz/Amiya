--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Scheme = require(Modules.Schemes.Default)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent

local Types = require(Components.Types)
type Button = Types.Button
type UsedAs<T> = Fusion.UsedAs<T>

local function Button(
    scope: Types.ComponentScope,
    props: Types.TextButtonProps & Types.Properties<{
        AnchorPoint: Vector2?,
        Position: UsedAs<UDim2>?,
        BackgroundTransparency: UsedAs<number>?,
        BackgroundColor3: UsedAs<Color3>?
    }>
): Button

    local deriveScope = Fusion.deriveScope(scope)
    local colorLayerOpacity = Fusion.Value(deriveScope, 1)

    return scope:New 'TextButton' {
        Name = 'Button',
        BackgroundTransparency = props.BackgroundTransparency or 0,
        BackgroundColor3 = props.BackgroundColor3 or Scheme.Color.Header,
        Size = props.Size or UDim2.fromOffset(150, 35),
        ZIndex = props.ZIndex,
        LayoutOrder = props.LayoutOrder,

        AnchorPoint = props.AnchorPoint or Vector2.new(0, 0),
        Position = props.Position or UDim2.fromScale(0, 0),

        [Children] = {
            ColorLayer = deriveScope:New 'Frame' {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = colorLayerOpacity,
                ZIndex = 2,
                BackgroundColor3 = Color3.new(),

                [Children] = {
                    deriveScope:New 'UICorner' {},

                    (props :: any)[Children],
                },
            },

            deriveScope:New 'UICorner' {},
        },

        [OnEvent 'InputEnded'] = function(input)
            if table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }, input.UserInputType) then
                if props.OnClick then
                    props.OnClick()
                end
            end
        end,

        [OnEvent 'MouseEnter'] = function()
            colorLayerOpacity:set(0.85)
        end,

        [OnEvent 'MouseLeave'] = function()
            colorLayerOpacity:set(1)
        end,
    } :: Button
end

return Button
