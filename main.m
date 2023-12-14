clc
clear
close all

%% Parameters

n = 3;
m = 2;
p = 2;

T = 10;   
tau = 0.01; 
laps = 4;
max_iterations = round(T * laps / (5*tau ));
time = linspace(0, T, max_iterations);

center = [0; 0];
r = 1;
trajectory = "Circle";

states = zeros(n, max_iterations);
controls = zeros(m, max_iterations);
x0 = [0; 0; 0];

y_des = genTrajectory(p, max_iterations, trajectory, laps, center, r);


%% Simulation
for k = 1:max_iterations-1

    u = feedbackLinearization(states, y_des(:, k));

    tspan = [time(k), time(k+1)];
    [t, x] = ode45(@(t, x) dynamic(x, u), tspan, x0);
    x0 = x(end, :)';
    states(:, k+1) = x0;

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