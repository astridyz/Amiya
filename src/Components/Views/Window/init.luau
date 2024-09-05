--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Assets = require(Modules.Assets)
local Scheme = require(Modules.Schemes.Default)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children
local peek = Fusion.peek

local Types = require(Components.Types)
type Window<D = Instance> = Types.Window<D>
type UsedAs<T> = Fusion.UsedAs<T>

local function Window(
    scope: Types.ComponentScope,
    props: Types.Properties<{
        Visible: UsedAs<boolean>?,
        Position: UDim2?,
        Size: UDim2?,
        AspectRatio: UsedAs<number>?,
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

        BackgroundColor3 = Scheme.Color.Background,
        BackgroundTransparency = 0.15,

        [Children] = {
            BorderBase = deriveScope:New 'Frame' {
                BackgroundTransparency = 1,

                Size = UDim2.fromScale(1.01, 1.01),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),

                [Children] = {
                    deriveScope:New 'UIStroke' {
                        Color = Scheme.Color.Header,
                        Thickness = 1.5,
                    },
                },
            },

            Texture = deriveScope:New 'ImageLabel' {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),

                Image = Assets.Components.BatthernTexture,
                ImageTransparency = 0.8,
                ScaleType = Enum.ScaleType.Tile,
                TileSize = UDim2.fromScale(0.4, 0.4),
            },

            Fusion.Computed(scope, function(use)
                return if props.AspectRatio and use(props.AspectRatio) >= 0
                    then deriveScope:New 'UIAspectRatioConstraint' {
                        AspectRatio = peek(props.AspectRatio) or 3 / 2,
                        AspectType = Enum.AspectType.ScaleWithParentSize,
                        DominantAxis = Enum.DominantAxis.Width,
                    }
                    else nil
            end),

            (props :: any)[Children],
        },
    } :: Window
end

return Window
