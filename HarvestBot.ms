import "Bot"
HarvestBot = new Bot
HarvestBot.harvest_area = {"upLeft": [55,48],"downRight":[63,54]}


//Public 
HarvestBot.harvest = function()
    path = HarvestBot.construct_path()
    HarvestBot.harvest_path(path)
    HarvestBot.Bot.face_n(0)
    wait(2)
    HarvestBot.Bot.drop([56,48],"Fiber")
end function

HarvestBot.set_harvest_area = function(pos1, pos2)
    //Check upLeft and upRight 
    HarvestBot.harvest_area.upLeft = pos1
    HarvestBot.harvest_area.downRight = pos2
end function

HarvestBot.clear_area = function()
    //HarvestBot.move_to(harbest_area[0],harvest_area[1])
    for i in range(HarvestBot.harvest_area[0],HarvestBot.harvest_area[2])
		me.clearAndMove 3
        if i % 2 then
			me.right; me.clearAndMove; me.right
		else
			me.left; me.clearAndMove; me.left
		end if
	end for
end function

HarvestBot.print_path = function(path)
    for y in range(HarvestBot.harvest_area.upLeft[1],HarvestBot.harvest_area.downRight[1])
        for x in range(HarvestBot.harvest_area.upLeft[0],HarvestBot.harvest_area.downRight[0])
            text.delimiter = ""
            print("[", null)

            if HarvestBot.is_in_path(path,x,y) then
                print("X",null)
            else
                print(" ",null)
            end if

            print("]",null)
        end for 
        print char(13)
    end for
end function

HarvestBot.is_in_path = function(path,x,y)
    for p in path 
        if p[0] == x and p[1] == y then 
        return true
        end if 
    end for
    return false
end function

//Private
HarvestBot.construct_path = function
    path = []
    start_pos = [HarvestBot.harvest_area.upLeft[0]+1, HarvestBot.harvest_area.upLeft[1]+1]
    end_pos = [HarvestBot.harvest_area.downRight[0]-1, HarvestBot.harvest_area.downRight[1]-1]
    current_pos = start_pos
    x = start_pos[0]
    //get to positions
    path.push([start_pos[0],start_pos[1]-1])
    path.push(start_pos)
    
    while x <= end_pos[0]

        if current_pos[1] == start_pos[1] then 
            path = path + HarvestBot.Bot.create_pathline_y(current_pos, end_pos)
            current_pos = path[path.len-1]
        else 
            path = path + HarvestBot.Bot.create_pathline_y(current_pos, start_pos)
            current_pos = path[path.len-1]
        end if
        
        if x+1 > end_pos[0] and current_pos[1] == end_pos[1] then
           break
        end if
        test = [current_pos[0]+3,current_pos[1]]
        path = path + HarvestBot.Bot.create_pathline_x(current_pos,test)
        current_pos = path[path.len-1]
        x = current_pos[0]
        
    end while 
    HarvestBot.print_path(path)
    return path
end function

HarvestBot.harvest_path = function(path,action)
    if path[0][0] == me.position.x and path[0][1] == me.position.y then 
        print("Same start")
        path.pull
    end if 
    
    for p in path
        HarvestBot.Bot.face_new_cell(p)
        HarvestBot.harvest_move 
    end for

end function

HarvestBot.harvest_move = function
    me.right
    me.harvest
    wait(0.2)
    me.left
    me.left
    me.harvest
    wait(0.2)
    me.right
    me.harvest    
    wait(0.2)
    me.forward
end function

