sub init()
    ' m.top.functionName = "getJsonFile"
    ' m.top.functionName = "getJsonFromServer"
end sub
'asi se hace para obtener informacion que esta hosteada en mi pc
sub getJsonFile()
    print "TASK IS RUNNING"
    fileContent = ReadAsciiFile(m.top.jsonFilePath)
    ?"-- fileContent --", fileContent
    jsonObject = ParseJson(fileContent)
    print "Parsed Content ", jsonObject
    m.top.content = jsonObject
end sub
'asi se hace para obtener la informacion desde un servidor
sub getJsonFromServer()
    request = createObject("roUrlTransfer")
    request.setUrl("http://192.168.50.242:3000/profiles")
    response = request.getToString()
    ?"-- server response --", response
    json = ParseJson(response)
    m.top.content = json
end sub