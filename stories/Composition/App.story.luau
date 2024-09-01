local Packages = game.ReplicatedStorage.Packages

local Fusion = require(Packages.Fusion)
local Children = Fusion.Children

local Amiya = require(Packages.Amiya)
local Components = Amiya.Components

local function Story(props)
    local scope = Fusion.scoped(Fusion, Components)

	local window = scope:Window {
		Stroke = true,
		
        [Children] = {
			scope:TopAppBar {
				Title = 'Entity #350',
				Subtitle = 'Host: Annah_Banna'	
			},
			
			--// Content test
			scope:New "Frame" {
				BackgroundTransparency = 1,
				AnchorPoint = UDim2.fromScale(5, 5),

				Position = UDim2.fromScale(0.1, 0.12),
				Size = UDim2.fromScale(0.8, 0.88)
			}
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