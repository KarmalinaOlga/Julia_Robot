function lesnica!(r::Robot)
    
    vert = moves!(r, Sud)
    hor = moves!(r, Ost)

    max = moves!(r, West)

    marker_lesnica!(r,max)

    moves!(r,Sud)
    moves!(r, Ost)

    movements!(r,West,hor)
    movements!(r,Nord,vert)

end

function moves!(r::Robot, side::HorizonSide)
    steps = 0
    while isborder(r, side) == false 
        move!(r,side)
        steps += 1
    end
    return steps
end

function movements!(r::Robot,side::HorizonSide,steps::Int) 
    for _ in 1:steps
        move!(r,side)
    end
end

function marker_lesnica!(r::Robot,max::Int)  
    i = 1
    while (i <= max) 
        if (isborder(r,Ost) == false)
            putmarker!(r) 
            move!(r,Ost)
        end

        putmarker!(r)

        i+=1

    end

    moves!(r,West)

    if (isborder(r,Nord)== false)
        move!(r,Nord)
        max -=1
        marker_lesnica!(r,max)
    end
end
