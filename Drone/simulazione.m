clc
% clear
close all

%% Pre-Processing dati

x_quota = out.x_quota.Data;
x_pitch = out.x_pitch.Data;

%% Simulazione

axis = "YZ";

for i=1:size(x_quota,1)
    h = x_quota(i, 1);
    y = x_pitch(i, 1);
    theta = x_pitch(i, 3);
    disegna_cubo_orientabile(h, y, theta, axis);
end

function disegna_cubo_orientabile(z, y, angolo_pitch, axis)
    % Dimensioni del cubo
    lunghezza_lati = 2;
    lunghezza_braccio = 2;
    altezza_eli = 0;

    % Coordinate del centro del cubo
    x = 0;

    % Vertici del cubo non orientato
    vertici_cubo = [
        x - lunghezza_lati/2, y - lunghezza_lati/2, z - lunghezza_lati/2;
        x + lunghezza_lati/2, y - lunghezza_lati/2, z - lunghezza_lati/2;
        x + lunghezza_lati/2, y + lunghezza_lati/2, z - lunghezza_lati/2;
        x - lunghezza_lati/2, y + lunghezza_lati/2, z - lunghezza_lati/2;
        x - lunghezza_lati/2, y - lunghezza_lati/2, z + lunghezza_lati/2;
        x + lunghezza_lati/2, y - lunghezza_lati/2, z + lunghezza_lati/2;
        x + lunghezza_lati/2, y + lunghezza_lati/2, z + lunghezza_lati/2;
        x - lunghezza_lati/2, y + lunghezza_lati/2, z + lunghezza_lati/2;
    ];

    % Matrice di rotazione per l'angolo di pitch
    rotazione_pitch = [cos(angolo_pitch), -sin(angolo_pitch), 0; sin(angolo_pitch), cos(angolo_pitch), 0; 0, 0, 1];

    % Applica la rotazione ai vertici del cubo
    vertici_cubo_rotati = (rotazione_pitch * vertici_cubo')';

    % Disegna il cubo orientato
    figure(1);
    plot3([vertici_cubo_rotati(1, 1), vertici_cubo_rotati(2, 1)], [vertici_cubo_rotati(1, 2), vertici_cubo_rotati(2, 2)], [vertici_cubo_rotati(1, 3), vertici_cubo_rotati(2, 3)], 'b-', 'LineWidth', 2);
    hold on;
    plot3([vertici_cubo_rotati(2, 1), vertici_cubo_rotati(3, 1)], [vertici_cubo_rotati(2, 2), vertici_cubo_rotati(3, 2)], [vertici_cubo_rotati(2, 3), vertici_cubo_rotati(3, 3)], 'b-', 'LineWidth', 2);
    plot3([vertici_cubo_rotati(3, 1), vertici_cubo_rotati(4, 1)], [vertici_cubo_rotati(3, 2), vertici_cubo_rotati(4, 2)], [vertici_cubo_rotati(3, 3), vertici_cubo_rotati(4, 3)], 'b-', 'LineWidth', 2);
    plot3([vertici_cubo_rotati(4, 1), vertici_cubo_rotati(1, 1)], [vertici_cubo_rotati(4, 2), vertici_cubo_rotati(1, 2)], [vertici_cubo_rotati(4, 3), vertici_cubo_rotati(1, 3)], 'b-', 'LineWidth', 2);

    plot3([vertici_cubo_rotati(5, 1), vertici_cubo_rotati(6, 1)], [vertici_cubo_rotati(5, 2), vertici_cubo_rotati(6, 2)], [vertici_cubo_rotati(5, 3), vertici_cubo_rotati(6, 3)], 'b-', 'LineWidth', 2);
    plot3([vertici_cubo_rotati(6, 1), vertici_cubo_rotati(7, 1)], [vertici_cubo_rotati(6, 2), vertici_cubo_rotati(7, 2)], [vertici_cubo_rotati(6, 3), vertici_cubo_rotati(7, 3)], 'b-', 'LineWidth', 2);
    plot3([vertici_cubo_rotati(7, 1), vertici_cubo_rotati(8, 1)], [vertici_cubo_rotati(7, 2), vertici_cubo_rotati(8, 2)], [vertici_cubo_rotati(7, 3), vertici_cubo_rotati(8, 3)], 'b-', 'LineWidth', 2);
    plot3([vertici_cubo_rotati(8, 1), vertici_cubo_rotati(5, 1)], [vertici_cubo_rotati(8, 2), vertici_cubo_rotati(5, 2)], [vertici_cubo_rotati(8, 3), vertici_cubo_rotati(5, 3)], 'b-', 'LineWidth', 2);

    plot3([vertici_cubo_rotati(1, 1), vertici_cubo_rotati(5, 1)], [vertici_cubo_rotati(1, 2), vertici_cubo_rotati(5, 2)], [vertici_cubo_rotati(1, 3), vertici_cubo_rotati(5, 3)], 'b-', 'LineWidth', 2);
    plot3([vertici_cubo_rotati(2, 1), vertici_cubo_rotati(6, 1)], [vertici_cubo_rotati(2, 2), vertici_cubo_rotati(6, 2)], [vertici_cubo_rotati(2, 3), vertici_cubo_rotati(6, 3)], 'b-', 'LineWidth', 2);
    plot3([vertici_cubo_rotati(3, 1), vertici_cubo_rotati(7, 1)], [vertici_cubo_rotati(3, 2), vertici_cubo_rotati(7, 2)], [vertici_cubo_rotati(3, 3), vertici_cubo_rotati(7, 3)], 'b-', 'LineWidth', 2);
    plot3([vertici_cubo_rotati(4, 1), vertici_cubo_rotati(8, 1)], [vertici_cubo_rotati(4, 2), vertici_cubo_rotati(8, 2)], [vertici_cubo_rotati(4, 3), vertici_cubo_rotati(8, 3)], 'b-', 'LineWidth', 2);

     % Disegna le eliche del drone
    disegna_elica(x, y, z, +lunghezza_braccio, altezza_eli, angolo_pitch);
    disegna_elica(x, y, z, -lunghezza_braccio, altezza_eli, angolo_pitch);

    title("3D Plot of Drone Control");
    xlim([-10 10]);
    ylim([-10 10]);
    zlim([-5 15]);
    grid on
    hold off
    
    if (strcmp(axis, "YZ") == 1)
        view(90, 0);
    elseif (strcmp(axis, "XYZ") == 1)
        view(45, 45);
    else
        view(0, 0);
    end
end

function disegna_elica(x, y, z, lunghezza_braccio, altezza_eli, angolo_pitch)
    % Posizioni delle eliche
    posizione_elica = [x, y + lunghezza_braccio, z + altezza_eli];

    % Rotazione delle posizioni delle eliche in base all'angolo di pitch
    rotazione_pitch = [cos(angolo_pitch), -sin(angolo_pitch), 0; sin(angolo_pitch), cos(angolo_pitch), 0; 0, 0, 1];
    posizione_elica_rotata = (rotazione_pitch * posizione_elica')';

    % Raggio del cerchio dell'elica
    raggio_cerchio = 1;

    % Numero di punti per disegnare il cerchio
    num_punti = 100;

    % Angoli per disegnare il cerchio
    angoli = linspace(0, 2*pi, num_punti);

    % Coordinate dei cerchi
    cerchio_x = posizione_elica_rotata(1) + raggio_cerchio * cos(angoli);
    cerchio_y = posizione_elica_rotata(2) + raggio_cerchio * sin(angoli);
    cerchio_z = posizione_elica_rotata(3) * ones(1, num_punti);

    % Disegna i cerchi
    plot3(cerchio_x, cerchio_y, cerchio_z, 'r-', 'LineWidth', 2);
end

