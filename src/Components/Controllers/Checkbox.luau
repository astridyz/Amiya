--!strict
local Components = script.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Assets = require(Modules.Assets)
local Scheme = require(Modules.Schemes.Default)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children
local peek = Fusion.peek
local Computed = Fusion.Computed

local Button = require(script.Parent.Button)

local Types = require(Components.Types)
type Checkbox = Types.Checkbox
type Value<V> = Fusion.Value<V>

local function Checkbox(
    scope: Types.ComponentScope,
    props: Types.TogglingProps & Types.Properties
): Checkbox

    props.Toggled = props.Toggled or Fusion.Value(scope, false)
    local toggled: Value<boolean> = props.Toggled :: any

    return Button(scope, {
        Size = UDim2.fromOffset(30, 30),
        ZIndex = props.ZIndex or 1,

        BackgroundColor3 = Computed(scope, function(use)
            return use(toggled) and Scheme.Color.Header or Scheme.Color.DarkHeader
        end),

        [Children] = {
            CheckMark = scope:New 'ImageLabel' {
                BackgroundTransparency = 1,
                Image = Assets.Icons.Check,
                ImageColor3 = Scheme.Color.Background,

                AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(0.7, 0.7),
                ImageTransparency = Fusion.Computed(scope, function(use)
                    return use(toggled) and 0 or 1
                end)
            },

            scope:New 'UIAspectRatioConstraint' {
                AspectRatio = 1
            }
        },

        OnClick = function()
            if props.OnClick then
                props.OnClick(toggled)
            else
                toggled:set(not peek(toggled))
            end
        end
    })
end

return Checkbox