clc
clear
close all

%% System

syms x1 x2 x3 csi

f = [cos(x3)*csi; sin(x3)*csi; 0; 0];
g1 = [0; 0; 0; 1];
g2 = [0; 0; 1; 0];
y1 = x1;
y2 = x2;
h = [y1, y2];
g = [g1, g2];
relativeVectorDegree = [2, 2]; 

phi = changeCoordinates(f, h);
[A, b] = normalForm(f, g, h, relativeVectorDegree);

%% Parameters

n = size(f, 1);
m = size(g, 2);
p = size(h, 2);

T = 10;   
tau = 0.01; 
laps = 1;
max_iterations = round(T * laps / (5*tau ));
time = linspace(0, T, max_iterations);

center = [0; 0];
r = 1;
trajectory = "8 Circle";

states = zeros(n, max_iterations);
controls = zeros(m, max_iterations);
zita0 = [0; 0; 0];

y_des = genTrajectory(p, trajectory);


%% Simulation

for k = 1:max_iterations-1

    u = control(states(:, k), y_des(:, k), A, b, relativeVectorDegree);
    
    tspan = [time(k), time(k+1)];
    [t, zita] = ode45(@(t, zita) dynamic(zita, u), tspan, zita0);
    zita0 = zita(end, :)';
    states(:, k+1) = zita0;

    controls(:, k) = u;
end

%% Plots

figure(1)
hold on
plot(time, states(1:2, :));
plot(time, y_des);
grid on;
title("Feedback Linearization States")
legend("x", "y", "x_{des}", "y_{des}");

figure(2)
plot(time, controls);
grid on
title("Feedback Linearization Controls")
legend("v", "ω");