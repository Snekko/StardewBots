// Kan ta emot olika datastrukter som har cost definerad och sorterar efter största cost, Kan lätt ändra till en min heap om du vill  

PriorityQueue = {}
PriorityQueue.list = [] //list of nodes 

PriorityQueue.enqueue = function(Node)  
    PriorityQueue.list.push(Node)
    for i in range(round(PriorityQueue.list.len / 2)-1, -1)
        if i<0 then continue
        PriorityQueue.heapify(i)    
    end for
end function

PriorityQueue.heapify = function(index)
     largest = index
     l = 2*index+1
     r = 2*index+2
     if l < PriorityQueue.list.len and PriorityQueue.list[largest].cost < PriorityQueue.list[l].cost then 
        largest = l 
     end if 
     if r < PriorityQueue.list.len and PriorityQueue.list[largest].cost < PriorityQueue.list[r].cost then 
        largest = r 
     end if 
     if largest != index then
        PriorityQueue.swap(largest, index)
        PriorityQueue.heapify(largest)
     end if
end function

PriorityQueue.dequeue = function
    PriorityQueue.swap(0,PriorityQueue.list.len-1)
    res = PriorityQueue.list.pop
    for i in range(round(PriorityQueue.list.len / 2)-1, -1)
        if i<0 then continue
        PriorityQueue.heapify(i)    
    end for
    return res
end function

PriorityQueue.swap = function(Index1,Index2)
    temp = PriorityQueue.list[Index1]
    PriorityQueue.list[Index1] = PriorityQueue.list[Index2] 
    PriorityQueue.list[Index2] = temp 
end function
