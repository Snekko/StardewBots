import "Bot"
HarvestBot = new Bot
HarvestBot.harvest_area = {"upLeft": [56,48],"downRight":[66,58]}


//Public 
HarvestBot.harvest = function()

    path = HarvestBot.construct_path()
    HarvestBot.Bot.move_path(path)
    
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




//Private
HarvestBot.construct_path = function
    path = []
    start_pos = [HarvestBot.harvest_area.upLeft[0]+1, HarvestBot.harvest_area.upLeft[1]]
    end_pos = [HarvestBot.harvest_area.downRight[0]-1, HarvestBot.harvest_area.downRight[1]]
    current_pos = start_pos
    x = start_pos[0]
    
    while x+3 < end_pos[0]
        
        path = path + HarvestBot.create_pathline_y(current_pos, end_pos)
        current_pos = path[path.len-1]
        
        test = [current_pos[0]+3,current_pos[1]]
        path = path + HarvestBot.create_pathline_x(current_pos,test)
        current_pos = path[path.len-1]
        

        path = path + HarvestBot.create_pathline_y(current_pos, start_pos)
        current_pos = path[path.len-1]
        
        test = [current_pos[0]+3,current_pos[1]]
        path = path + HarvestBot.create_pathline_x(current_pos,test)
        current_pos = path[path.len-1]

        x = current_pos[0]
        
    end while 
    return path
end function

HarvestBot.create_pathline_y = function(start_pos, end_pos)
    current_pos = start_pos
    line = []
    for y in range(start_pos[1],end_pos[1])
            new_pos = current_pos[0:]
            new_pos[1] = y
            current_pos = new_pos
            line.push(current_pos)
    end for
    return line
end function

HarvestBot.create_pathline_x = function(start_pos, end_pos)
    current_pos = start_pos
    line = []
    for x in range(start_pos[0],end_pos[0])
            new_pos = current_pos[0:]
            new_pos[0] = x
            current_pos = new_pos
            line.push(current_pos)
    end for
    return line
end function


HarvestBot.harvest_move = function
    me.right
    me.harvest
    me.left
    me.left
    me.harvest
    me.right
    me.harvest
    me.forward 
end function

