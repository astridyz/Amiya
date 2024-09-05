--!strict
local Packages = game.ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local Children = Fusion.Children

local Amiya = require(Packages.Amiya)
local Components = Amiya.Components

local function Story(props)
    local scope = Fusion.scoped(Fusion, Components)
    local visibility = scope:Value(true)

    local window = scope:Window {
        Visible = visibility,
        Size = UDim2.fromOffset(400, 1100),
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
