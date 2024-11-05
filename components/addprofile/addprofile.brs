sub init()
    m.background1 = m.top.findNode("background1")
    m.poster = m.top.findNode("poster")
    ' m.padding = 33
    m.top.observeField("focusedChild", "onFocusChanged")

end sub

sub onFocusChanged ()
    greencolor = "#2DED36"
    greycolor = "#D7DBDD"

    if m.top.hasFocus() = true 
        m.background1.color = greencolor
    else 
        m.background1.color = greycolor

    end if
end sub

sub onImageChanged()

    m.poster.uri = m.top.uri

end sub

function onKeyEvent (key as string, press as boolean) as boolean

    handle = false
    print "Button component = okey " , key, "Press -->" , press
    if press = true then

        if key = "ok" then
            m.top.buttonselected = true
            handle = true
        end if
    else
        handle = true
    end if

    return handle
end function
