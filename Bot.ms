
Bot = {}
Bot.name = me.name
Bot.job = ""

//Public

Bot.drop = function(chest_loacation,item)
me.walk_to(chest_loacation[0],chest_loacation[1]-1)
me.forward
Bot.face_n(0)
for i in me.inventory
    if i == {} then 
        continue
    end if 
    if i.name == item then
        me.select(item)
        me.placeItem
    end if
end for 

//drop item in chest
end function

Bot.recharge = function(loacation)
//moves to specified chest and picks up batteries 
    
end function


//Private

Bot.move_path = function(path,action)
    
    if path[0][0] == me.position.x or path[0][1] == me.position.y then 
        print("Same start")
        path.pull
    end if 
    
    for p in path
        Bot.face_new_cell(p)
        me.forward 
        wait(1)
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

Bot.create_pathline_y = function(start_pos, end_pos)
    current_pos = start_pos
    line = []
    for y in range(start_pos[1],end_pos[1])
            if y == start_pos[1] then 
                continue 
            end if
            new_pos = current_pos[0:]
            new_pos[1] = y
            current_pos = new_pos
            line.push(current_pos)
    end for
    return line
end function

Bot.create_pathline_x = function(start_pos, end_pos)
    current_pos = start_pos
    line = []
    for x in range(start_pos[0],end_pos[0])
        if x == start_pos[0] then 
            continue 
        end if    
            new_pos = current_pos[0:]
            new_pos[0] = x
            current_pos = new_pos
            line.push(current_pos)
    end for
    return line
end function

