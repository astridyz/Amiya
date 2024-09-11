--!strict
local Packages = game.ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local Children = Fusion.Children

local Amiya = require(Packages.Amiya)
local Components = Amiya.Components

local function Story(props)
    local scope = Fusion.scoped(Fusion, Components)
    local visibility = scope:Value(true)

    local window = scope:Portrait {
        Visible = visibility,
        Size = UDim2.fromOffset(250, 250),
        AspectRatio = 1.5,

        [Children] = {
            scope:TopAppBar {
                Title = 'Entity #365',
                Subtitle = 'Hoster: Annah_Banna',

                [Children] = {
                    scope:AppBarButton {
                        Icon = Amiya.Icons.CircleX,
                    },
                },
            } :: any,

            --// Content test
            scope:New 'Frame' {
                Size = UDim2.new(1, 0, 1, -25),
                Position = UDim2.fromOffset(0, 25),
                BackgroundTransparency = 1,

                [Children] = {
                    scope:Button {} :: any,
                    scope:TextButton {
                        Text = 'Download',
                    } :: any,

                    scope:New 'UIListLayout' {
                        Padding = UDim.new(0.05),
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    },

                    scope:New 'UIPadding' {
                        PaddingTop = UDim.new(0.05),
                    },
                },
            },
        },
    }
    window.Parent = props.target

    return function()
        scope:doCleanup()
    end
end

return {
    fusion = Fusion,
    story = Story,
}
