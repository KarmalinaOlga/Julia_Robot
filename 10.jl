function srednee_emper!(r::Robot)
    side = Ost
    count = 0
    temp = 0
    result = 0
    temp = temperat(r,side,result,count)
    return temp
end

function temperat(r::Robot,side::HorizonSide, count::Int, result::Int)
    while (isborder(r,side)==false)
        move!(r,side)
        if (ismarker(r) == true)
            result += temperature(r)
            count += 1
        end
    end 

    if (isborder(r,Nord)==false)
        move!(r,Nord)
        if (ismarker(r) == true)
            result += temperature(r)
            count += 1
        end
        side = invers(side)
        temperat(r,side,count,result)
    end
    return result/ count
end