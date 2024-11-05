sub init()
    m.profile1 = m.top.findNode("rectangle11")
    m.profile2 = m.top.findNode("rectangle21")
    m.profile3 = m.top.findNode("rectangle31")
    m.profile4 = m.top.findNode("rectangle41")

    m.profile12 = m.top.findNode("rectangle12")
    m.profile22 = m.top.findNode("rectangle22")
    m.profile32 = m.top.findNode("rectangle32")
    m.profile42 = m.top.findNode("rectangle42")

    m.profile1.observeField("focusedChild","onFocusChanged")
    m.profile2.observeField("focusedChild","onFocusChanged")
    m.profile3.observeField("focusedChild","onFocusChanged")
    m.profile4.observeField("focusedChild","onFocusChanged")

    m.profile12.observeField("focusedChild","onFocusChanged")
    m.profile22.observeField("focusedChild","onFocusChanged")
    m.profile32.observeField("focusedChild","onFocusChanged")
    m.profile42.observeField("focusedChild","onFocusChanged")


end sub

sub onFocusChanged()
    greencolor = "#2DED36"
    greycolor = "#D7DBDD"
    whitecolor = "#FFFFFF"

    if m.profile1.hasFocus() = true then
        ' m.profile1.opacity = 1
        ' m.profile2.opacity = 0.4
        ' m.profile3.opacity = 0.4
        ' m.profile4.opacity = 0.4

        m.profile1 = greencolor
        m.profile2 = greycolor
        m.profile3 = greycolor
        m.profile4 = greycolor

        m.profile12.visible = true
        m.profile22.visible = false
        m.profile32.visible = false
        m.profile42.visible = false

    elseif m.profile2.hasFocus() = true then
        ' m.profile1.opacity = 0.4
        ' m.profile2.opacity = 1
        ' m.profile3.opacity = 0.4
        ' m.profile4.opacity = 0.4
        m.profile1 = greycolor
        m.profile2 = greencolor
        m.profile3 = greycolor
        m.profile4 = greycolor

        m.profile12.visible = false
        m.profile22.visible = true
        m.profile32.visible = false
        m.profile42.visible = false

    elseif m.profile3.hasFocus() = true then
        ' m.profile1.opacity = 0.4
        ' m.profile2.opacity = 0.4
        ' m.profile3.opacity = 1
        ' m.profile4.opacity = 0.4
        m.profile1 = greycolor
        m.profile2 = greycolor
        m.profile3 = greencolor
        m.profile4 = greycolor

        m.profile12.visible = false
        m.profile22.visible = false
        m.profile32.visible = true
        m.profile42.visible = false
    elseif m.profile4.hasFocus() = true then
        ' m.profile1.opacity = 0.4
        ' m.profile2.opacity = 0.4
        ' m.profile3.opacity = 0.4
        ' m.profile4.opacity = 1
        m.profile1 = greycolor
        m.profile2 = greycolor
        m.profile3 = greycolor
        m.profile4 = greencolor

        m.profile12.visible = false
        m.profile22.visible = false
        m.profile32.visible = false
        m.profile42.visible = true

    end if
    if m.profile12.hasFocus() then
        m.profile1.color = greycolor
        m.profile12.color = greencolor
    else if m.profile22.hasFocus() then
        m.profile2.color = greycolor
        m.profile22.color = greencolor
    else if m.profile32.hasFocus() then
        m.profile3.color = greycolor
        m.profile32.color = greencolor
    else if m.profile42.hasFocus() then
        m.profile4.color = greycolor
        m.profile42.color = greencolor
    end if
end sub

function onKeyEvent( key as string, press as boolean) as boolean

    handled = true

    print "key --", key, "Press --", press

    if press = true then 
        if key = "right" then
            if m.profile1.hasFocus() then
                m.profile2.setFocus(true)
            else if m.profile2.hasFocus()
                m.profile3.setFocus(true)
            else if m.profile3.hasFocus()
                m.profile4.setFocus(true)

            end if 
        else if key = "left" then
            if m.profile4.hasFocus() then
                m.profile3.setFocus(true)
            else if m.profile3.hasFocus() 
                m.profile2.setFocus(true)
            else if m.profile2.hasFocus()
                m.profile1.setFocus(true)
            end if
        else if key = "down" then
            if m.profile1.hasFocus() then
                m.profile12.hasFocus(true)
            else if m.profile2.hasFocus() then
                m.profile22.setFocus(true)
            else if m.profile3.hasFocus() then
                m.profile32.setFocus(true)
            else if m.profile4.hasFocus() then
                m.profile42.setFocus(true)
            end if
        else if key = "up" then
            if m.profile12.hasFocus() then
                m.profile1.hasFocus(true)
            else if m.profile22.hasFocus() then
                m.profile2.setFocus(true)
            else if m.profile32.hasFocus() then
                m.profile3.setFocus(true)
            else if m.profile42.hasFocus() then
                m.profile4.setFocus(true)
            end if
        end if

    end if

    return handled
end function