--!strict
local Fusion = require(game.ReplicatedStorage.Packages.Fusion)
type Children = typeof(Fusion.Children)

export type ComponentScope = Fusion.Scope<{
    New: typeof(Fusion.New)
}>

export type Properties<others = {}> = others & {} & {
    Visible: boolean,
    Position: UDim2,
    Size: UDim2,
    ZIndex: number,
    [Children]: { Instance }
}

export type Window<derived = Instance> = Instance & derived & {
    Body: ImageLabel & derived,
    Border: ImageLabel,
    UIAspectRatioConstraint: UIAspectRatioConstraint
}

export type TopAppBar = Instance & {
    
}

return 0;