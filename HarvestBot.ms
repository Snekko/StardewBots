import "Bot"
HarvestBot = new Bot
HarvestBot.harvest_area = [97,53,100,50]


//Public 
HarvestBot.harvest = function()
    
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
create_harvest_path = function()
    
end function

