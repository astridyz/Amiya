local Packages = game.ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)

local Amiya = require(Packages.Amiya)
local Components = Amiya.Components

local function Story(props)
    local scope = Fusion.scoped(Fusion, Components)

    local window = scope:Window {}
    window.Parent = props.target

    return function()
        scope:doCleanup()
    end
end

return {
    fusion = Fusion,
    story = Story
}