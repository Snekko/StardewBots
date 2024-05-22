me.harvest_line = function(length)
    for i in range(length)
        me.harvest
        me.forward
    end for
end function

me.harvest_square = function(height, length)
    me.face_dir(3)
    for i in range(height)
        harvest_line(length)
        if i%2 == 2 then
            me.left
            me.forward
            me.left
        else
            me.right
            me.forward
            me.right
        end if
    end for
end function

face_dir = function(n)
    direction = me.facing
    for i in range(direction-n%4)
        me.left
    end for
end function
