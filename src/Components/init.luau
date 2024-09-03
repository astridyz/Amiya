local Views = script.Views
local Controllers = script.Controllers

return {
    Window = require(Views.Window),
    TopAppBar = require(Views.TopAppBar),
    AppBarButton = require(Controllers.AppBarButton),
}
