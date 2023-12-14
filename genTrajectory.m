function y_des = genTrajectory(p, max_iterations, trajectory, laps, center, r)

y_des = zeros(p, max_iterations);

switch trajectory

    case "Circle" % Circle
        theta = linspace(0, laps*2*pi, max_iterations);
        for i = 1:max_iterations
            y_des(1, i) = center(1, 1) + r*cos(theta(i));
            y_des(2, i) = center(2, 1) + r*sin(theta(i));
        end

    case "8 Circle" % 8 Circle

    otherwise
        disp('Trajectory not valid');
        return;

end
