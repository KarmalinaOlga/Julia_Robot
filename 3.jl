function vse_pole_in_marcers!(r::Robot) 
    vert = moves!(r, Sud)
    hor = moves!(r, West)

    side = Ost
    putmarkers_in_pole!(r,side) 
    putmarker!(r) 

    moves!(r,Sud)
    moves!(r, West)

    movements!(r,Ost,hor)
    movements!(r,Nord,vert)
end

function putmarkers_in_pole!(r::Robot,side::HorizonSide)
    while isborder(r,side) == false 
        putmarker!(r)
        move!(r,side)
    end

    if (isborder(r,Nord) == false)
        putmarker!(r)
        move!(r,Nord)
        side = HorizonSide(mod(Int(side) + 2,4))
        putmarkers_in_pole!(r,side)
    end
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

