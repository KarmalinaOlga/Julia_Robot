function mark_frame_perimetr!(r::Robot)
    vert = moves!(r, Sud)
    hor = moves!(r, West)
    s = 0

    for side in (Nord, Ost, Sud, West)
        putmarkers!(r, side)
    end 

    for side in (Nord, Ost, Sud, West)
        putmarkers!(r, side)
    end 

    moves!(r, Sud)
    moves!(r, West)

    moves!(r, Nord, vert)
    moves!(r, Ost, hor)
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
    
    if s!=4
        while isborder(r,side)==false
            move!(r,side)
            putmarker!(r)
            s = s+1
        end
    end

    moves!(r, Nord, 1)
    moves!(r, Ost, 1)

    if s=4
        while ismarker(r,side) == false
            move!(r,side)
            putmarker!(r)
        end 
    end
end