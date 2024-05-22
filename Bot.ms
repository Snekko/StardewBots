
direction_map = {"down":3, "left":0, "right":2, "up":1}
Bot = {}
Bot.direction = me.facing


//Public

Bot.move_to = function
    
end function





//Private

me.face_n = function(n)
    direction = me.facing
    for i in range(direction-n%4)
        me.left
    end for
end function

me.face = function(direction)
    currdir = me.facing
    for i in range(currdir-direction_map[direction])
        me.left
    end for
end function
