--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Assets = require(Modules.Assets)
local Scheme = require(Modules.Schemes.Default)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children
local Child = Fusion.Child

local Types = require(Components.Types)
type TopAppBar = Types.TopAppBar

local function TopAppBar(
    scope: Types.ComponentScope,
    props: Types.Properties<{
        Title: string?,
        Subtitle: Fusion.UsedAs<string>?,
    }>
): TopAppBar

    local deriveScope = Fusion.deriveScope(scope)

    return scope:New 'Frame' {
        Name = 'TopAppBar',

        BackgroundColor3 = Scheme.Color.Header,
        ZIndex = props.ZIndex or 2,
        Size = UDim2.new(1.03, 0, 0, 40),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),

        [Children] = {

            Right = deriveScope:New 'Frame' {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),

                [Children] = {
                    IconBase = deriveScope:New 'Frame' {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),

                        [Children] = {
                            deriveScope:New 'UIAspectRatioConstraint' {
                                AspectRatio = 1,
                            },

                            deriveScope:New 'ImageLabel' {
                                Name = 'Icon',

                                BackgroundTransparency = 1,
                                Image = Assets.Icons.Info,
                                ImageColor3 = Color3.new(0, 0, 0),
                                ScaleType = Enum.ScaleType.Fit,

                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                Size = UDim2.fromScale(0.5, 0.5),
                            },
                        },
                    },

                    Text = deriveScope:New 'Frame' {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0, 1),
                        LayoutOrder = 2,

                        [Children] = Child {
                            Title = deriveScope:New 'TextLabel' {
                                BackgroundTransparency = 1,
                                LayoutOrder = 2,
                                Size = UDim2.fromOffset(0, -14),

                                Font = Enum.Font.GothamBold,
                                Text = props.Title or 'Info',
                                TextSize = 14,
                                TextXAlignment = Enum.TextXAlignment.Left,
                            },

                            Fusion.Computed(deriveScope, function(use)
                                return if props.Subtitle and use(props.Subtitle)
                                    then deriveScope:New 'TextLabel' {
                                        Name = 'Subtitle',

                                        BackgroundTransparency = 1,
                                        LayoutOrder = 2,
                                        Size = UDim2.fromOffset(0, -14),

                                        Font = Enum.Font.GothamMedium,
                                        Text = props.Subtitle,
                                        TextColor3 = Color3.new(0.3, 0.3, 0.3),
                                        TextSize = 14,
                                        TextXAlignment = Enum.TextXAlignment.Left,
                                    }
                                    else nil
                            end),

                            deriveScope:New 'UIListLayout' {
                                FillDirection = Enum.FillDirection.Vertical,
                                VerticalAlignment = Enum.VerticalAlignment.Center,
                            },
                        },
                    },

                    deriveScope:New 'UIListLayout' {
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    },
                },
            },

            Buttons = deriveScope:New 'Frame' {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),

                [Children] = {
                    deriveScope:New 'UIListLayout' {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    },

                    (props :: {})[Children],
                },
            },
        },
    } :: TopAppBar
end

return TopAppBar
