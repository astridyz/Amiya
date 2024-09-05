--!strict
local Players = game:GetService 'Players'
local Packages = game.ReplicatedStorage.Packages

local Amiya = require(Packages.Amiya)

local Fusion = require(Packages.Fusion)
local Children = Fusion.Children

local PlayerGui = Players.LocalPlayer.PlayerGui
local guiScope = Fusion.scoped(Fusion, Amiya.Components)

local PortraitVisibility = guiScope:Value(true)
local WindowVisibility = guiScope:Value(true)

local function CloseButton(visibility)
    return guiScope:AppBarButton(
		{
			Icon = Amiya.Icons.CircleX,
			OnClick = function()
			visibility:set(false)
			end,
		}
	)
end

guiScope:New 'ScreenGui' {
    Parent = PlayerGui,

    [Children] = Fusion.Child {
        guiScope:Portrait {
            Visible = PortraitVisibility,
            Size = UDim2.fromOffset(200, 200),

            [Children] = {
                guiScope:TopAppBar {
                    Title = 'Title',
                    Subtitle = 'Subtitle',

                    [Children] = {
                        CloseButton(PortraitVisibility),
                    },
                },
            },
        },

        guiScope:Window {
            Visible = WindowVisibility,
            Size = UDim2.fromOffset(400, 1100),
            AspectRatio = 1.5,

            [Children] = {
                guiScope:TopAppBar {
                    Title = 'Title',
                    Subtitle = 'Subtitle',

                    [Children] = {
                        CloseButton(WindowVisibility),
                    },
                },
            },
        },

        guiScope:New 'UIListLayout' {
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0.1, 0),
        },

        guiScope:New 'UIPadding' {
            PaddingLeft = UDim.new(0.1, 0),
        },
    },
}
