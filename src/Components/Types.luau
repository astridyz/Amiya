--!strict
local Fusion = require(game.ReplicatedStorage.Packages.Fusion)
type Children = typeof(Fusion.Children)

export type ComponentScope = Fusion.Scope<{
    New: typeof(Fusion.New),
}>

export type Properties<derived = {}> = derived & {
    ZIndex: number?,
    [Children]: Children?,
}

export type Window<children = {}> = Frame & children & {
    Body: ImageLabel,
    Border: ImageLabel,
    Texture: ImageLabel,
    UIAspectRatioConstraint: UIAspectRatioConstraint,
}

export type TopAppBar<buttons = {}> = Frame & {
    Right: Frame & {
        UIListLayout: UIListLayout,
        IconBase: Frame & {
            UIAspectRatioConstraint: UIAspectRatioConstraint,
            Icon: ImageLabel,
        },
        Text: Frame & {
            UILayout: UILayout,
            Title: TextLabel,
            Subtitle: TextLabel?,
        },
    },
    Buttons: Frame & {
        UILayout: UILayout,
    } & buttons,
}

export type Button<derived = {}> = TextButton & derived

export type AppBarButton = Button<{
    Icon: ImageLabel,
}>

return 0
