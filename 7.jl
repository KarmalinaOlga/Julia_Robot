module ShessMark
using  HorizonSideRobots
export mark_chess, set

FLAG_MARK = false

set(value::Bool) = (FLAG_MARK=value; nothing)

function mark_chess(r,side)
    global FLAG_MARK
    while isborder(r,side)==false
        if FLAG_MARK == true
            putmarker(r)
        end
        move!(r,side); FLAG_MARK = !FLAG_MARK
    end   
end

function move!(r,side)
    global FLAG_MARK
    FLAG_MARK = !FLAG_MARK
    HorizonSideRobots.move!(r,side)
end

end

function mark_chess(robot)

    num_vert, num_hor = StartBlack.move_to_start!((Sud,West))
    
    ChessMark.set(even([num_vert+num_hor]))

    side = Ost
    mark_chess(robot,side)
    while isborder(Nord)==false
        ChessMark.move!(robot,Nord)
        side = inverse(side)
        ChessMark.mark_chess(robot,side)
    end

for side in (West,Sud) moves!(robot,side) end

StartBlack.move_to_back(robot)

end