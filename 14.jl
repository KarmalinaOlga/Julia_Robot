function mark_kross(r::Robot)
    for side in (Nord, West, Sud, Ost)
        steps = putmarkers!(r,side)
        movements!(r,invers(side), steps)
    end
    putmarker!(r)
end

function putmarkers!(r::Robot,side::HorizonSide)
    steps=0 
    while move_probably!(r, side) == true
        putmarker!(r)
        steps += 1
    end 
    return steps
end
movements!(r::Robot, side::HorizonSide, steps::Int) = for _ in 1:steps move!(r,side) end

movements!(r::Robot, side::HorizonSide) = while isborder(r,side)==false move!(r,side) end 

movements!(r::Robot, side::HorizonSide, steps::Int) =

for _ in 1:steps
    move_probably!(r,side) 
end

function move_probably!(r::Robot, direct::HorizonSide)::Bool
    orthogonal = left(direct)
    reverse = invers(orthogonal)
    steps=0
    while isborder(r,direct) == true
        if isborder(r, orthogonal) == false
            move!(r, orthogonal)
            steps += 1
        else
            break
        end
    end

    if isborder(r,direct) == false
        move!(r,direct)
        while isborder(r,reverse) == true
            move!(r,direct)
        end
        result = true
    else
        result = false
    end
    for _ in 1:steps
        move!(r,reverse)
    end
    return result
end
