' sub init()

'     m.scene = m.top.findNode("profileScene")
'     m.scene.setFocus(true)

' end sub


sub init()
    m.scenes = m.top.findNode("scenes")
    m.router = Router()
    m.router.initialize(m.scenes)
    m.router.navigateToScene("loginScene", {}, false)
end sub

sub routingEventCallback(event as object)
    eventData = event.getData()
    if eventData.type = "PROFILE_SELECTED" then
        m.router.navigateToScene("homeScene", eventData.data, false)
    else if eventData.type = "SIGN_IN" then
        m.router.navigateToScene("profileScene", eventData.data, false)
    end if
end sub

function onKeyEvent(key as string, press as boolean) as Boolean
    handled = false
    if press and key = "back" then
        m.router.navigateToPreviousScene()
        handled = true
    end if
    return handled
end function