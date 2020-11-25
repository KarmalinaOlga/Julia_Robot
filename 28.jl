module FindMarker
    export find_marker!

    using HorizonSideRobots
    include("../8/horizonside.jl")
    include("functional_robot.jl")

    function find_marker!(robot)
 robot = interface_protected_robot(robot)
 rectangular_borders = interface_rectangular_borders(robot)

        function move_ifnomarker!(side)::Bool
            if robot.ismarker()
                return false
            end
            rectangular_borders.move!(side) # - return true
        end
        
        trajectories = interface_trajectories(robot)
        trajectories.spiral!(move_ifnomarker!)
    end
end