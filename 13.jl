function kross_x(r::Robot)
    for side in ((Nord,Ost),(Sud,Ost),(Sud,West),(Nord,West))
        putmarkers!(r,side)
        move_markers!(r,invers(side))
    end
    putmarker!(r)
end

function putmarkers!(r::Robot,side::NTuple{2,HorizonSide})
    while isborder(r,side)==false  
        move!(r,side)
        putmarker!
    end 
end

HorizonSideRobots.isborder(r::Robot,side::NTuple{2,HorizonSide}) = (isborder(r,side[1]) || isborder(r,side[2]))

HorizonSideRobots.move!(r::Robot, side::NTuple{2,HorizonSide}) = for s in side move!(r,s) end 

move_markers!(r::Robot,side::NTuple{2,HorizonSide}) = while ismarker(r)==true move!(r,side) end

invers(side::NTuple{2,HorizonSide}) = (invers(side[1]),invers(side[2]))