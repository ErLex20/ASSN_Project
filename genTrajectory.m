function y_des = genTrajectory(p, trajectory)

Ax = 1;
Ay = 1;
omega_x = 1;
omega_y = 2;
phi_x = 0;
phi_y = 0;

syms t
y_des = sym('y', [p 1]);

switch trajectory
    case "8 Circle" % 8 Circle
        y_des(1) = Ax * sin(omega_x * t + phi_x);
        y_des(2) = Ay * sin(omega_y * t + phi_y);

    otherwise
        disp('Trajectory not valid');
        return;

end
