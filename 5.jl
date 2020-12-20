function mark_angles(r) 
    steps=[]

    while isborder(r,Sud)==false || isborder(r,West) == false 
        push!(steps, moves!(r, West))
        push!(steps, moves!(r, Sud))
    end

    for side in (Nord,Ost,Sud,West)
        moves!(r,side)
        putmarker!(r)
    end

    for (i,n) in enumerate(steps)
        side = isodd(i) ? Nord : Ost 
        movements!(r,side,n)
    end
end

function movements!(r::Robot,side::HorizonSide,steps::Int) 
    for _ in 1:steps
        move!(r,side)
    end
end

function moves!(r::Robot, side::HorizonSide)

    while isborder(r, side) == false 
        move!(r,side)
    end

end
