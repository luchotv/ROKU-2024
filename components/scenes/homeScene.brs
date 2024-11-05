sub init()
    m.background = m.top.findNode("background")
    m.welcomeLabel = m.top.findNode("welcomeLabel")

    m.top.observeField("focusedChild", "onFocusChanged")
end sub


sub initDataChanged(event as object)
    initData = event.getData()
    if initData <> invalid and initData.name <> invalid then 
        m.welcomeLabel.text = "Welcome " + initData.name + "!"
    end if
end sub

sub onFocusChanged()
    if m.top.hasFocus() then
        ?"-- Home Scene in focus chain --"
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press = true then

    end if
    return handled
end function