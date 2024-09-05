--!strict
local Components = script.Parent.Parent.Parent
local Amiya = Components.Parent
local Modules = Amiya.Modules

local Assets = require(Modules.Assets)

local Fusion = require(Amiya.Parent.Fusion)
local Children = Fusion.Children

local Window = require(script.Parent)

local Types = require(Components.Types)
type Window = Types.Window

local function Portrait(
    scope: Types.ComponentScope,
    props: Types.Properties
): Window

    return Window(
        scope,
        {
            AspectRatio = 2/3,
            Background = Assets.Components.PortraitBg,
            Border = Assets.Components.PortraitStroke,

            [Children] = (props :: any)[Children]
        }
    ) :: Window
end

return Portrait