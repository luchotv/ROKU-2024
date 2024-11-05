sub init()
    m.done = false
    m.jsonParser = createObject("roSGNode", "JsonParser")
    m.jsonParser.functionName = "getJsonFile"
    m.jsonParser.jsonFilePath = "pkg:/source/json/profiles.json"
    m.jsonParser.observeField("content", "setContent")
    print "RUN TASK"
    m.jsonParser.control = "RUN"
    ' Fetching the profiles
    m.profile1 = m.top.findNode("profile1")
    m.profile2 = m.top.findNode("profile2")
    m.profile3 = m.top.findNode("profile3")
    m.profile4 = m.top.findNode("profile4")
    m.top.observeField("focusedChild", "onFocusChanged")
    m.lastFocused = "profile1"
end sub

sub setContent()
    print "TASK IS DONE"
    m.content = m.jsonParser.content
    m.jsonParser.control = "STOP"

    m.profile1.name = m.content[0].name
    m.profile2.name = m.content[1].name
    m.profile3.name = m.content[2].name
    m.profile4.name = m.content[3].name

    m.profile1.uri = m.content[0].imagePath
    m.profile2.uri = m.content[1].imagePath
    m.profile3.uri = m.content[2].imagePath
    m.profile4.uri = m.content[3].imagePath

    if m.done = false then
        ?"--rerun--"
        m.done = true
        m.jsonParser.functionName = "getJsonFromServer"
        m.jsonParser.control = "RUN"
    end if
end sub

sub onFocusChanged()
    if m.top.hasFocus() then
        ?"-- in focus chain --"
        m[m.lastFocused].setFocus(true)
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press = true then
        if key = "OK" then
            m.top.nameSelected = m[m.lastFocused].name
            m.top.profileSelected = true
            ?"-- last name focused: " +  m.top.nameSelected + " --"
            handled = true
        else if key = "right" then
            if m.profile1.hasFocus() then
                ?"--focusing horse --"
                m.profile2.setFocus(true)
                m.lastFocused = "profile2"
                handled = true
            else if m.profile2.hasFocus() then
                ?"--focusing dog --"
                m.profile3.setFocus(true)
                m.lastFocused = "profile3"
                handled = true
            else if m.profile3.hasFocus() then
                ?"--focusing dog --"
                m.profile4.setFocus(true)
                m.lastFocused = "profile4"
                handled = true
            end if
        else if key = "left" then
            if m.profile4.hasFocus() then
                ?"--focusing horse --"
                m.profile3.setFocus(true)
                m.lastFocused = "profile3"
                handled = true
            else if m.profile3.hasFocus() then
                ?"--focusing horse --"
                m.profile2.setFocus(true)
                m.lastFocused = "profile2"
                handled = true
            else if m.profile2.hasFocus() then
                ?"--focusing cat --"
                m.profile1.setFocus(true)
                m.lastFocused = "profile1"
                handled = true
            end if
        end if
    end if
    return handled
end function

' sub init()
'     m.done = false
'     m.jsonParser = createObject("roSGNode", "JsonParser")
'     m.jsonParser.functionName = "getJsonFile"
'     m.jsonParser.jsonFilePath = "pkg:/source/json/profiles.json"
'     m.jsonParser.observeField("content", "setContent")
'     print "RUN TASK"
'     m.jsonParser.control = "RUN"
'     ' Fetching the profiles
'     m.profile1 = m.top.findNode("rectangle11")
'     m.profile2 = m.top.findNode("rectangle21")
'     m.profile3 = m.top.findNode("rectangle31")
'     m.profile4 = m.top.findNode("rectangle41")

'     m.profile12 = m.top.findNode("rectangle12")
'     m.profile22 = m.top.findNode("rectangle22")
'     m.profile32 = m.top.findNode("rectangle32")
'     m.profile42 = m.top.findNode("rectangle42")

'     m.profile1.observeField("focusedChild","onFocusChanged")
'     m.profile2.observeField("focusedChild","onFocusChanged")
'     m.profile3.observeField("focusedChild","onFocusChanged")
'     m.profile4.observeField("focusedChild","onFocusChanged")

'     m.profile12.observeField("focusedChild","onFocusChanged")
'     m.profile22.observeField("focusedChild","onFocusChanged")
'     m.profile32.observeField("focusedChild","onFocusChanged")
'     m.profile42.observeField("focusedChild","onFocusChanged")

'     m.profile1.setFocus(true)
' end sub

' sub setContent()
'     print "TASK IS DONE"
'     m.content = m.jsonParser.content
'     m.jsonParser.control = "STOP"

'     m.profile1.name = m.content[0].name
'     m.profile2.name = m.content[1].name

'     m.profile1.uri = m.content[0].imagePath
'     m.profile2.uri = m.content[1].imagePath

'     if m.done = false then
'         ?"--retun--"
'         m.done = true
'         m.jsonParser.functionName = "getJsonFromServer"
'         m.jsonParser.control = "RUN"
'     end if
' end sub


' sub onFocusChanged()
'     greencolor = "#2DED36"
'     greycolor = "#D7DBDD"
'     whitecolor = "#FFFFFF"

'     if m.profile1.hasFocus() = true then
'         ' m.profile1.opacity = 1
'         ' m.profile2.opacity = 0.4
'         ' m.profile3.opacity = 0.4
'         ' m.profile4.opacity = 0.4

'         m.profile1.color = greencolor
'         m.profile2.color = greycolor
'         m.profile3.color = greycolor
'         m.profile4.color = greycolor

'         ' m.profile12.visible = true
'         ' m.profile22.visible = false
'         ' m.profile32.visible = false
'         ' m.profile42.visible = false

'     else if m.profile2.hasFocus() = true then
'         ' m.profile1.opacity = 0.4
'         ' m.profile2.opacity = 1
'         ' m.profile3.opacity = 0.4
'         ' m.profile4.opacity = 0.4
'         m.profile1.color = greycolor
'         m.profile2.color = greencolor
'         m.profile3.color = greycolor
'         m.profile4.color = greycolor

'         ' m.profile12.visible = false
'         ' m.profile22.visible = true
'         ' m.profile32.visible = false
'         ' m.profile42.visible = false

'     else if m.profile3.hasFocus() = true then
'         ' m.profile1.opacity = 0.4
'         ' m.profile2.opacity = 0.4
'         ' m.profile3.opacity = 1
'         ' m.profile4.opacity = 0.4
'         m.profile1.color = greycolor
'         m.profile2.color = greycolor
'         m.profile3.color = greencolor
'         m.profile4.color = greycolor

'         ' m.profile12.visible = false
'         ' m.profile22.visible = false
'         ' m.profile32.visible = true
'         ' m.profile42.visible = false
'     else if m.profile4.hasFocus() = true then
'         ' m.profile1.opacity = 0.4
'         ' m.profile2.opacity = 0.4
'         ' m.profile3.opacity = 0.4
'         ' m.profile4.opacity = 1
'         m.profile1.color = greycolor
'         m.profile2.color = greycolor
'         m.profile3.color = greycolor
'         m.profile4.color = greencolor

'         ' m.profile12.visible = false
'         ' m.profile22.visible = false
'         ' m.profile32.visible = false
'         ' m.profile42.visible = true

'     end if

'     ' if m.profile12.hasFocus() then
'     '     m.profile1.color = greycolor
'     '     m.profile12.color = greencolor
'     ' else if m.profile22.hasFocus() then
'     '     m.profile2.color = greycolor
'     '     m.profile22.color = greencolor
'     ' else if m.profile32.hasFocus() then
'     '     m.profile3.color = greycolor
'     '     m.profile32.color = greencolor
'     ' else if m.profile42.hasFocus() then
'     '     m.profile4.color = greycolor
'     '     m.profile42.color = greencolor
'     ' end if
' end sub

' function onKeyEvent( key as string, press as boolean) as boolean

'     handled = true

'     print "key -->", key, "Press -->", press

'     if press = true then 
'         if key = "right" then
'             if m.profile1.hasFocus() then
'                 m.profile2.setFocus(true)
'             else if m.profile2.hasFocus()
'                 m.profile3.setFocus(true)
'             else if m.profile3.hasFocus()
'                 m.profile4.setFocus(true)
'             else if m.profile12.hasFocus() then
'                 m.profile22.setFocus(true)
'             else if m.profile22.hasFocus()
'                 m.profile32.setFocus(true)
'             else if m.profile32.hasFocus()
'                 m.profile42.setFocus(true)
'             end if 
'         else if key = "left" then
'             if m.profile4.hasFocus() then
'                 m.profile3.setFocus(true)
'             else if m.profile3.hasFocus() 
'                 m.profile2.setFocus(true)
'             else if m.profile2.hasFocus()
'                 m.profile1.setFocus(true)
'             else if m.profile42.hasFocus() then
'                 m.profile32.setFocus(true)
'             else if m.profile32.hasFocus() 
'                 m.profile22.setFocus(true)
'             else if m.profile22.hasFocus()
'                 m.profile12.setFocus(true)
'             end if
'         else if key = "down" then
'             if m.profile1.hasFocus() then
'                 m.profile12.setFocus(true)
'             else if m.profile2.hasFocus() then
'                 m.profile22.setFocus(true)
'             else if m.profile3.hasFocus() then
'                 m.profile32.setFocus(true)
'             else if m.profile4.hasFocus() then
'                 m.profile42.setFocus(true)
'             end if
'         else if key = "up" then
'             if m.profile12.hasFocus() then
'                 m.profile1.setFocus(true)
'             else if m.profile22.hasFocus() then
'                 m.profile2.setFocus(true)
'             else if m.profile32.hasFocus() then
'                 m.profile3.setFocus(true)
'             else if m.profile42.hasFocus() then
'                 m.profile4.setFocus(true)
'             end if
'         end if

'     end if

'     return handled
' end function