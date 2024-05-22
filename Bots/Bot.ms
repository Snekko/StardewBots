
Bot = {}
Bot.name = me.name
Bot.job = ""


//Public

Bot.drop = function(loacation)
//drop item in chest
    
end function

Bot.recharge = function(loacation)
//moves to specified chest and picks up batteries 
    
end function


//Private

Bot.move_to = function(cordinates)
//Moves to cordinates
    
end function

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
