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
        ZIndex = props.ZIndex or 1,
        Size = UDim2.new(1.2, 0, 0.08, 0),
        Position = UDim2.fromScale(-0.1, 0),

        [Children] = {

            deriveScope:New 'Frame' {
                Name = 'Right',

                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),

                [Children] = {
                    deriveScope:New 'UIListLayout' {
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    },

                    deriveScope:New 'Frame' {
                        Name = 'IconBase',

                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),

                        [Children] = {
                            deriveScope:New 'UIAspectRatioConstraint' {
                                AspectRatio = 1,
                            },

                            deriveScope:New 'ImageLabel' {
                                name = 'Icon',

                                BackgroundTransparency = 1,
                                Image = Assets.Icons.Info,
                                ImageColor3 = Color3.new(0, 0, 0),
                                ScaleType = Enum.ScaleType.Fit,

                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                Size = UDim2.fromScale(0.6, 0.6),
                            },
                        },
                    },

                    deriveScope:New 'Frame' {
                        name = 'Text',

                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0, 1),
                        LayoutOrder = 2,

                        [Children] = Child {
                            deriveScope:New 'UIListLayout' {
                                FillDirection = Enum.FillDirection.Vertical,
                                VerticalAlignment = Enum.VerticalAlignment.Center,
                            } ,

                            deriveScope:New 'TextLabel' {
                                name = 'Title',

                                BackgroundTransparency = 1,
                                Font = Enum.Font.GothamBold,
                                Text = props.Title or 'Info',
                                TextColor3 = Color3.new(0, 0, 0),
                                TextSize = 25,
                                TextXAlignment = Enum.TextXAlignment.Left,

                                Size = UDim2.fromScale(0, 0.5),
                            },

                            Fusion.Computed(deriveScope, function(use)
                                return if props.Subtitle and use(props.Subtitle)
                                    then deriveScope:New 'TextLabel' {
                                        name = 'Subtitle',

                                        BackgroundTransparency = 1,
                                        Size = UDim2.fromScale(0, 0.3),
                                        LayoutOrder = 2,
                                        Font = Enum.Font.GothamMedium,
                                        Text = props.Subtitle,
                                        TextColor3 = Color3.new(0.239216, 0.239216, 0.239216),
                                        TextSize = 20,
                                        TextXAlignment = Enum.TextXAlignment.Left,
                                    }
                                    else nil
                            end),
                        },
                    },
                },
            },

            deriveScope:New 'Frame' {
                Name = 'Buttons',

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

            deriveScope:New 'UICorner' {},
        },
    } :: TopAppBar
end

return TopAppBar
