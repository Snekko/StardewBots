// initieras av startup.ms
// location isa positon.area object
Overseer = {"farmName":null, location:null, map:{}, botList:[]}

// skapa textfil med ordrar / kolla så det finns

Overseer.add_bot = function(newBot)
    self.botList.push(newBot)
end function

Overseer.make_map = function
    for x in range(0, self.location.width-1)
        for y in range(0, self.location.height-1)
            tempTile = self.location.tile(x,y)
            if tempTile == null then
                //if tempTile.type != "Building" then print(tempTile.type)
                globals.self.map[[x,y]] = 1
            else if tempTile.passable == 1 then
                globals.self.map[[x,y]] = 1
            else
                globals.self.map[[x,y]] = 0
            end if
        end for
    end for
end function

// harvest

// allocate_harvest_partitions

// read_chat

// schedule

// battery chest location

// kollisioner? troligtvis inte

// INTE recharge, kanske att botten notifierar overseer? troligvtis inte