function mark_vnutri_perimetr!(r::Robot)
    steps=fill(0,3) 
    for (i,side::HorizonSide) in enumerate((Sud,West,Sud))
        steps[i]=moves!(r,side)
    end

    side = find_border!(r,Ost,side)

    mark_vnutri_perimetr!(r,side)

    moves!(r,Sud)
    moves!(r,West)

    for (i,side) in enumerate((Nord,Ost,Nord))
        movements!(r,side, steps[i])
    end
end

function mark_vnutri_perimetr!(r::Robot, side::HorizonSide)

    direction_step, direction_border = directions(side)

    for i ∈ 1:4   
        putmarkers!(r,  direction_step[i], direction_border[i]) 
    end
end

function directions(side::HorizonSide)
    if side == Nord       
        return (Nord,Ost,Sud, West), (Ost,Sud,West,Nord)
    else 
        return (Sud,Ost,Nord,West), (Ost,Nord,West,Sud) 
    end
end

function putmarkers!(r::Robot, direction_step::HorizonSide, direction_border::HorizonSide)

    while isborder(r,direction_border)==true
        move!(r,direction_step)
    end

end

function find_border!(r::Robot, direction_border::HorizonSide, direction_movement::HorizonSide)
    while isborder(r,direction_border)==false  
        if isborder(r,direction_movement)==false
            move!(r,direction_movement)
        else
            move!(r,direction_border)
            direction_movement=inverse(direction_movement)
        end
    end
end
