' sub main(args as dynamic)
'     showHomeScreen()
' end sub

' sub showHomeScreen()
'     'The roSGScreen object is a SceneGraph canvas that displays the contents of a SceneGraph Scene node instance
'     m.screen = CreateObject("roSGSCreen") 'Create Screen
'     'Messages describing events are sent to and received from objects of type "roMessagePort"
'     m.port = createObject("roMessagePort") 'Create message Port
'     'By calling m.screen.setMessagePort() in a particular component,
'     'you instruct that component to deliver messages to a particular roMessgePort.
'     'Your script can then receive messages from that port to be notified of the events related to that component.
'     m.screen.setMessagePort(m.port) 'Set message port
'     m.scene = m.screen.createScene("mainScene") ' Create Scene
'     m.screen.show()
'     print "La pantalla ha sido mostrada (shown)"

'     while (true)
'         'the script waits for an event to be delivered to the message port
'         msg = wait (0, m.port)
'         msgType = Type(msg)
'         if msgType = "roSGScreenEvent" then
'             if dfDrawMessage.isScreenClosed() then return
'         end if
'     end while
' end sub

sub main(args as object)

    ' Empieza a escribir tu codigo a partir de esta linea
    print "Bienvenido al Roku Academy"


    mostrarPantallaInicial()
end sub

sub mostrarPantallaInicial()
    pantalla = CreateObject("roSGScreen")
    puerto = CreateObject("roMessagePort")
    pantalla.setMessagePort(puerto)
    escena = pantalla.createScene("mainScene")

    pantalla.show()

    while(true)
        evento = wait(0, puerto)
        tipoEvento = type(evento)

        if tipoEvento = "roSGScreenEvent"
            if evento.isScreenClosed() then return
        end if
    end while
end sub