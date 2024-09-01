--!strict
local Fusion = require(game.ReplicatedStorage.Packages.Fusion)
type Children = typeof(Fusion.Children)

export type ComponentScope = Fusion.Scope<{
    New: typeof(Fusion.New)
}>

export type Properties<others = {}> = others & {
    ZIndex: number?,
    [Children]: Children?
}

export type Window<derived = Instance> = Frame & derived & {
    Body: ImageLabel & derived,
    Border: ImageLabel,
    UIAspectRatioConstraint: UIAspectRatioConstraint
}

export type TopAppBar<buttons = {}> = Frame & {
    Buttons: Frame & buttons & {UIListLayout: UIListLayout} 
}

return 0;