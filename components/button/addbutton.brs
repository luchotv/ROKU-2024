sub init()
    m.background = m.top.findNode("background")
    m.label = m.top.findNode("label")
    m.padding = 33
    m.top.observeField("focusedChild", "onFocusChanged")

end sub

sub onFocusChanged()

    greencolor = "#2DED36"
    greycolor = "#D7DBDD"

    if m.top.hasFocus() = true then
        m.background.color = greencolor
    else
        m.background.color = greycolor

    end if

end sub

sub onTextChanged()

    m.label.text = m.top.text
    labelBoundRect = m.label.boundingRect()
    width = labelBoundRect.width + (2 * m.padding)
    m.label.width = width
    m.background.width = width

end sub

function onKeyEvent (key as string, press as boolean) as boolean

    handle = false
    print "Button component = okey " , key, "Press -->" , press
    if press = true then

        if key = "ok" then
            m.top.buttonSelected = true
            handle = true
        end if
    else
        handle = true
    end if

    return handle
end function
