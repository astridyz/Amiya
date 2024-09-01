--!strict
local Packages = game.ReplicatedStorage.Packages
local Fusion = require(Packages.Fusion)

local function Story(
    component: (scope: Fusion.Scope<any>, props: { [any]: any }) -> Instance
): {
    fusion: typeof(Fusion),
    story: (props: { [string]: any }) -> () -> ()
}

    local function generate(props)
        local scope = Fusion:scoped { gen = component }

        local instance = scope:gen {}
        instance.Parent = props.target

        return function()
            scope:doCleanup()
        end
    end

    return {
        fusion = Fusion,
        story = generate
    }
end

return Story