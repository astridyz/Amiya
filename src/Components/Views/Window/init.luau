--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Assets = require(Modules.Assets)
local Scheme = require(Modules.Schemes.Default)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children
local Child = Fusion.Child
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
        Background: string?,
        Border: string?,
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

        [Children] = Child {
            Fusion.Computed(deriveScope, function(use)
                return if props.Background
                    then deriveScope:New 'ImageLabel' {
                        Name = 'Background',
                        Image = props.Background,
                        Size = UDim2.fromScale(1, 1),

                        ImageColor3 = Scheme.Color.Background,
                        ImageTransparency = 0.15,
                        BackgroundTransparency = 1,
                    }
                    else deriveScope:New 'Frame' {
                        Name = 'Background',
                        Size = UDim2.fromScale(1, 1),
                        BackgroundColor3 = Scheme.Color.Background,
                        BackgroundTransparency = 0.15,
                    }
            end),

            Fusion.Computed(deriveScope, function()
                return if props.Border
                    then deriveScope:New 'ImageLabel' {
                        Name = 'Border',
                        BackgroundTransparency = 1,
                        Image = props.Border,
                        Size = UDim2.fromScale(1.08, 1.04),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        ImageColor3 = Scheme.Color.Header,
                    }
                    else deriveScope:New 'Frame' {
                        Name = 'Border',
                        BackgroundTransparency = 1,

                        Size = UDim2.fromScale(1.02, 1.02),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),

                        [Children] = {
                            deriveScope:New 'UIStroke' {
                                Color = Scheme.Color.Header,
                                Thickness = 1.5,
                            },
                        },
                    }
            end),

            Texture = deriveScope:New 'ImageLabel' {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),

                Image = Assets.Textures.Batthern,
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
