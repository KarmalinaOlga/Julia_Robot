function mark_frame_perimetr!(r::Robot)
    steps=[]

    while (isborder(r,Sud)==false) || (isborder(r,West) == false)
        push!(steps, moves!(r, West))
        push!(steps, moves!(r, Sud))
    end
    
    for side in (Nord,Ost,Sud,West)
        putmarkers!(r, side) 
    end 
    
    for (i,n) in enumerate(steps)
        side = isodd(i) ? Ost : Nord
        movements!(r,side,n)
    end
end
    
function moves!(r::Robot,side::HorizonSide)

    steps=0

    while isborder(r,side)==false
        move!(r,side)
        steps+=1
    end

    return steps
end
    
function moves!(r::Robot,side::HorizonSide,steps::Int)

    for _ in 1:steps 
        move!(r,side)
    end
end
    
function putmarkers!(r::Robot, side::HorizonSide)

    putmarker!(r)
    
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end
