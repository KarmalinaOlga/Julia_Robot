function mark_angles(r::Robot)
    num_steps = through_rectangles_into_angle(r,(Sud,West))
       for side in (Nord,Ost,Sud,West)
        movements!(r,side) 
        putmarker!(r)
    end
       movements!(r,(Ost,Nord),num_steps)
end

function through_rectangles_into_angle(r,angle::NTuple{2,HorizonSide})
    num_steps=[]
    while isborder(r,angle[1])==false || isborder(r,angle[2]) # Робот - не в юго-западном углу
        push!(num_steps, movements!(r, angle[2]))
        push!(num_steps, movements!(r, angle[1]))
    end
    return num_steps
end

function movements!(r,sides,num_steps::Vector{Int})
    for (i,n) in enumerate(num_steps)
        movements!(r, sides[mod(i-1, length(sides))+1], n)
    end
end