local Packages = game.ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local Children = Fusion.Children

local Amiya = require(Packages.Amiya)
local Components = Amiya.Components

local function Story(props)
    local scope = Fusion.scoped(Fusion, Components)

	local window = scope:Window {
        [Children] = {
			scope:TopAppBar {
				Title = 'Entity #350',
				Subtitle = 'Host: Annah_Banna',

				[Children] = {
					scope:AppBarButton {
						Icon = Amiya.Icons.CircleX
					}
				}
			},
        }
    }
    window.Parent = props.target

    return function()
        scope:doCleanup()
    end
end

return {
    fusion = Fusion,
    story = Story
}