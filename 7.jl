function chahmati!(r::Robot)
    hor = moves!(r,West)
    vert = moves!(r,Sud)

   side = Ost

   if ((hor % 2) == 0) 
       if ((vert % 2) == 0) 
           putmarkstrue!(r,side)
       else 
           putmarksfalse!(r,side)
       end
   else
       putmarksfalse!(r,side)
   end

   move!(r,West)
   move!(r,Sud)

   movements!(r,Ost,hor)
   movements!(r,Nord,vert)

end

function putmarkstrue!(r::Robot,side::HorizonSide)
   move!(r,HorizonSide(mod(Int(side) + 2,4)))
   while isborder(r,side) == false
       putmarker!(r)
       for _ in 1:2
           if (isborder(r, side) == false)
               move!(r,side)
           else
               if (isborder(r,Nord) == false)
                   move!(r,Nord)
                   side = HorizonSide(mod(Int(side) + 2,4))
               end
           end
       end
   end
end

function putmarfalse1!(r::Robot,side::HorizonSide)
    move!(r,HorizonSide(mod(Int(side) + 2,4)))
    move!(r,side)
    while isborder(r,side) == false        
        putmarker!(r)
        for _ in 1:2
            if (isborder(r,side) == false)
                move!(r,side)
            else
                if (isborder(r,Nord) == fasle)
                    move!(r,Nord)
                    side = HorizonSide(mod(Int(side) + 2,4))
                    move!(r,side)
                end
            end
        end
    end
    putmarker!(r)
    if (isborder(r,Nord) == false)
        move!(r,Nord)
        putmarks2!(r,Ost)
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