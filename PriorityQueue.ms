import "listutil" 
Node = {"pos":[-1,-1],"cost":0} 

PriorityQueue = {}
PriorityQueue.list = [] //list of nodes 

PriorityQueue.enqueue = function(Node)  
    PriorityQueue.list.push(Node)
    PriorityQueue.heapify(0)
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
    PriorityQueue.heapify(0)
    return res
end function

PriorityQueue.swap = function(Index1,Index2)
    temp = PriorityQueue.list[Index1]
    PriorityQueue.list[Index1] = PriorityQueue.list[Index2] 
    PriorityQueue.list[Index2] = temp 
end function

test = new PriorityQueue
test.enqueue({"pos":[-1,-1],"cost":6})
test.enqueue({"pos":[-1,-1],"cost":2})
test.enqueue({"pos":[-1,-1],"cost":3})
test.enqueue({"pos":[-1,-1],"cost":4})
test.enqueue({"pos":[-1,-1],"cost":1})
test.enqueue({"pos":[-1,-1],"cost":9})


for i in test.list 
    print(i)
    print(test.list[i].cost)
end for 