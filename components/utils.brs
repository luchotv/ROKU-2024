sub centerNodeHorizontally (Node as dynamic)
    XPos = (1920 - node.boundingRect().width) /2
    node.translation = [XPos , 680]
end sub