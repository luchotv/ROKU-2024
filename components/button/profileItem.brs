sub init()
    m.frame = m.top.findNode("frame")
    m.poster = m.top.findNode("poster")
    m.button = m.top.findNode("button")
    m.top.observeField("focusedChild", "onFocusChanged")
    m.frame.opacity = 0.5
    m.button.visible = false
end sub

sub uriChanged()
    m.poster.uri = m.top.uri
end sub

sub nameChanged()
    m.button.text = m.top.name
end sub

sub onFocusChanged()
    ?"-- Setting focus to: " + m.top.name + "--", m.top.hasFocus()
    if m.top.hasFocus()
        m.frame.opacity = 1.0
        m.button.visible = true
    else
        m.frame.opacity = 0.5
        m.button.visible = false
    end if
end sub