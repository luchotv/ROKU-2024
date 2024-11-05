sub centerNodeHorizontally (Node as dynamic)
    XPos = (1920 - node.boundingRect().width) /2
    node.translation = [XPos , 580]
end sub