--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Scheme = require(Modules.Schemes.Default)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children
local peek = Fusion.peek
local Tween = Fusion.Tween
local Computed = Fusion.Computed

local Button = require(script.Parent.Button)

local Types = require(Components.Types)
type Switch = Types.Switch
type Value<V> = Fusion.Value<V>

local function Switch(
    scope: Types.ComponentScope,
    props: Types.TogglingProps & Types.Properties
): Switch

    props.Toggled = props.Toggled or Fusion.Value(scope, false)
    local toggled: Value<boolean> = props.Toggled :: any

    return Button(scope, {
        Size = UDim2.fromOffset(40, 40),
        CornerRadius = UDim.new(0.9),
        ZIndex = props.ZIndex or 1,

        BackgroundColor3 = Computed(scope, function(use)
            return use(toggled) and Scheme.Color.Header or Scheme.Color.DarkHeader
        end),

        [Children] = {
            Circle = scope:New 'Frame' {
                Size = UDim2.new(1, -6, 1, -6),
                Position = Tween(
                    scope,
                    Computed(scope, function(use)
                        if use(toggled) then
                            return UDim2.new(0.6, 0, 0, 3)
                        else
                            return UDim2.new(0, 4, 0, 3)
                        end
                    end),
                    TweenInfo.new(0.15, Enum.EasingStyle.Quint)
                ),

                [Children] = {
                    scope:New 'UIAspectRatioConstraint' {
                        AspectRatio = 1
                    },

                    scope:New 'UICorner' {
                        CornerRadius = UDim.new(1)
                    }
                }
            },

            scope:New 'UIAspectRatioConstraint' {
                AspectRatio = 2/1
            }
        },

        OnClick = function()
			if props.OnClick then
				props.OnClick(toggled)
			else
				toggled:set(not peek(toggled))
			end
		end,
    })
end

return Switch