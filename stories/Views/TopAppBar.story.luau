local Story = require(script.Parent)
local Packages = game.ReplicatedStorage.Packages

local Amiya = require(Packages.Amiya)
local Components = Amiya.Components

return Story(Components.TopAppBar)