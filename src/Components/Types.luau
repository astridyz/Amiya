--!strict
local Fusion = require(game.ReplicatedStorage.Packages.Fusion)
type Children = typeof(Fusion.Children)
type UsedAs<T> = Fusion.UsedAs<T>

export type ComponentScope = Fusion.Scope<{
    New: typeof(Fusion.New),
}>

export type Properties<derived = {}> = derived & {
    ZIndex: number?,
    [Children]: {[any]: Instance},
}

export type Window<children = {}> = Frame & children & {
    Background: ImageLabel | Frame,
    Border: Frame & {UIStroke: UIStroke},
    Texture: ImageLabel,
    UIAspectRatioConstraint: UIAspectRatioConstraint?,
}

export type WindowProps = {
    Visible: UsedAs<boolean>?,
    Size: UDim2?
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

export type AmiyaTextButton<derived = {}> = derived & Button<{ Text: TextLabel }>

export type TextButtonProps = {
    Size: UsedAs<UDim2>?,
    LayoutOrder: UsedAs<number>?,
    OnClick: () -> ()?,
}

export type IconButton<derived = {}> = derived & Button<{ Icon: ImageLabel }>

export type IconButtonProps = {
    Icon: string?,
    Size: Fusion.UsedAs<UDim2>?,
    LayoutOrder: Fusion.UsedAs<number>?,
    OnClick: () -> ()?,
}

export type AppBarButton = IconButton

export type Checkbox = Button<{
    CheckMark: ImageLabel,
    UIAspectRatioConstraint: UIAspectRatioConstraint
}>

export type Switch = Button<{}>

export type TogglingProps = {
    Toggled: Fusion.Value<boolean>?,
    OnClick: (toggled: Fusion.StateObject<boolean>) -> ()?
}

return 0