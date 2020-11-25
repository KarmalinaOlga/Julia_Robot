module MarkersCounter #номера задачь сЪехали и было две 28, поэтому я сдвинула все на 1, восстановив нумирацию 
    export markers_counter!

    using HorizonSideRobots
    include("../8/horizonside.jl")
    include("functional_robot.jl")

    function markers_counter!(robot)
 robot = interface_protected_robot(robot)
 rectangular_borders = interface_rectangular_borders(robot)
 line = interface_line(rectangular_borders.move!)
 trajectories = interface_trajectories(robot)

        counter() = if robot.ismarker() num_markers+=1 end
        
 num_markers = 0
 trajectories.labirint_snake!(Ost, Nord) do side
            counter()
 line.movements!(counter, side)
            return true
        end

        return num_markers
    end

end



