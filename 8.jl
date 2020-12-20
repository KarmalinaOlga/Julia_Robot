function robot_peregorodka!(r::Robot)
    side = Ost
    peregorodka!(r,side)
end

function peregorodka!(r::Robot,side::HorizonSide)
    i = 1
    while (isborder(r,Nord) == true)
    m = 0
            while (m != i)
                move!(r,side)
                m+=1
            end
            i+=1
            side = HorizonSide(mod(Int(side)+2,4))
    end
end