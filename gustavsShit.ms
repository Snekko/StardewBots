import "listUtil"

infinity = 10^9
Cell = {"pos":[-1,-1],"cost":infinity, "parent":-1}

// TODO:
// errorhantering
// face_n gör mig ledsen, me.face behöver liten justering (samma med alla andra riktningar)
// priority queue
// emigrera
// Cell???
// wait? verkar ibland inte gå hela vägen

map = {}
location = me.position.area
for x in range(0, location.width-1)
    for y in range(0, location.height-1)
        tempTile = location.tile(x,y)
        if tempTile then
            //if tempTile.type != "Building" then print(tempTile.type)
            map[[x,y]] = tempTile.passable
        end if
    end for
end for


me.face_n = function(n)
    n = n%4
    if n < 0 then n = n+4
    while true
        if me.facing == n then
            break
        end if
        me.left
    end while
end function

me.face = function(direction)
    direction_map = {"down":2, "left":3, "right":1, "up":0}
    currdir = me.facing
    for i in range(currdir-direction_map[direction])
        me.left
    end for
end function


me.face_down = function
    me.face_dir(3)
end function


me.face_left = function
    me.face_dir(0)
end function


me.face_right = function
    me.face_dir(2)
end function


me.face_up = function
    me.face_dir(1)
end function




Cell.adjacent_cells = function
    adjacent_cells_list = []
    directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    for direction in directions
        tempx = self.pos[0]-direction[0]
        tempy = self.pos[1]-direction[1]
        
        if map.hasIndex([tempx, tempy]) then 
            // måste separera så det inte blir keyerror
            if map[[tempx,tempy]] == 1 then
                tempCell = new Cell
                tempCell.pos = [tempx, tempy]
                adjacent_cells_list.push(tempCell)
            end if
        end if
    end for
    return adjacent_cells_list
end function



me.a_star = function(destination)
    start = new Cell
    start.pos = [me.position.x, me.position.y]
    if start == destination then
        return start
    end if
    if map[destination] == 0 then return null
    //if map.len == 0 then
    //    me.create_map
    //end if
    frontier = []
    cost_so_far = {}
    cost_so_far[start.pos] = 0
    frontier.push start
    while frontier

        // sort jättedyrt
        frontier.sort "cost"
        frontier = frontier.reversed
        q = frontier.pop
        if q.pos == destination then
                return q
        end if

        stepchildren = q.adjacent_cells
        
        q.fuck_mom(stepchildren)
        
        for stepchild in stepchildren
            new_cost = cost_so_far[q.pos] + d(q, stepchild)
            
            // om jag inte separerar här så blir den sur
            if not cost_so_far.hasIndex(stepchild.pos) then
                cost_so_far[stepchild.pos] = new_cost
                stepchild.cost = new_cost + d(stepchild, destination)
                frontier.push(stepchild)
            else if new_cost < cost_so_far[stepchild.pos] then
                cost_so_far.replace(stepchild.pos,new_cost) 
                stepchild.cost = new_cost + d(stepchild, destination)
                frontier.push(stepchild)
            end if
        end for
    end while
end function

d = function(x,y)
    if x isa Cell then
        x = x.pos
    end if
    if y isa Cell then
        y = y.pos
    end if
    return abs(x[0] - y[0]) + abs(x[1]-y[1])
end function

Cell.sub = function(other)
    return [self.pos[0]-other.pos[0], self.pos[1]-other.pos[1]]
end function

Cell.fuck_mom = function(stepchildren) //become their parent
    if stepchildren isa list then
        for stepchild in stepchildren
            stepchild.parent = self
        end for
    else
        stepchild.parent = self
    end if
end function

me.walk_to = function(x,y)
    finalNode = me.a_star([x,y])
    if finalNode == null then
        print "no path could be found"
        return
    end if
    path = me.reconstruct_path(finalNode)
    me.walk_path(path)
end function

me.walk_path = function(path)
    print(path)
    prev_dir = path[0]
    me.face_n(prev_dir)
    for direction in path
        if prev_dir != direction then me.face_n(direction)
        me.forward
        prev_dir = direction
        //wait(0.1)
    end for
end function

// {"down":3, "left":0, "right":2, "up":1}
me.reconstruct_path = function(final_cell)
    prev = final_cell
    next = final_cell.parent
    dir_map = {[0, 1]:2, 
    [0, -1]:0,
    [1, 0]:1, 
    [-1, 0]:3}

    path = []
    while next != -1
        path.push(dir_map[prev.sub(next)])
        prev = next
        next = prev.parent
    end while
    return path.reversed
end function

// börjar stardews koordinater på 0?
is_valid_pos = function(pos)
    x = pos[0]
    y = pos[1]
    return (y >= 0) and (y < me.position.area.height - 1) and (x >= 0) and (x < me.position.area.width - 1)
end function
