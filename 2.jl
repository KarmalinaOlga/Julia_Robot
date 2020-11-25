function mark_frame_perimetr!(r::Robot)
    vert = moves!(r, Sud)
    hor = moves!(r, West)

    for side in (Nord, Ost, Sud, West)
        putmarkers!(r, side)
    end 

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
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end