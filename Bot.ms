
Bot = {}
Bot.name = me.name
Bot.job = ""


//Public

Bot.drop = function(loacation)
//drop item in chest
print("Drop")
end function

Bot.recharge = function(loacation)
//moves to specified chest and picks up batteries 
    
end function


//Private

Bot.move_path = function(path)
    
    if path[0][0] != me.position.x or path[0][1] != me.position.y then 
        print("Not same start")
        path.pull
    end if 
    
    for p in path
        print(p)
        Bot.face_new_cell(p)
        me.forward
        wait(5)
    end for


end function

Bot.get_path = function(location)
    
end function

Bot.face_new_cell = function(cell) //most be adjacent cell 
    if me.position.x < cell[0] then
        Bot.face_n(1)
    end if
    if me.position.x > cell[0] then
        Bot.face_n(3)
    end if
    if me.position.y < cell[1] then
        Bot.face_n(2)
    end if
    if me.position.y > cell[1] then
        Bot.face_n(0)
    end if

end function

Bot.face_n = function(n)
    while me.facing != n 
        me.left
    end while
end function


