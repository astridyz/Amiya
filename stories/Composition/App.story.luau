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
					
					--// Button test
					scope:New 'ImageLabel' {
						Size = UDim2.fromScale(0.6, 0.6),
						Image = Amiya.Icons.CircleX,
						ImageColor3 = Color3.new(0, 0, 0),
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						ScaleType = Enum.ScaleType.Fit,

						[Children] = {
							scope:New 'UIAspectRatioConstraint' {
								AspectRatio = 1
							}
						}
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