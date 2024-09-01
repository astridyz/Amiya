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

export type Window<derived = Instance> = Instance & derived & {
    Body: ImageLabel & derived,
    Border: ImageLabel,
    UIAspectRatioConstraint: UIAspectRatioConstraint
}

export type TopAppBar = Instance & {
    Buttons: Frame & {UIListLayout: UIListLayout}
}

return 0;