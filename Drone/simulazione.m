clc
% clear
close all

%% Pre-Processing dati

x_height = out.x_height.Data;
x_pitch = out.x_pitch.Data;

%% Simulazione

axis = "XYZ";

for i=1:size(x_height,1)
    h = x_height(i, 1);
    x = x_pitch(i, 1);
    theta = x_pitch(i, 3);
    disegna_cubo_orientabile(h, x, theta, axis);
end

function disegna_cubo_orientabile(z, x, theta, axis)
    % Dimensioni del cubo
    lunghezza_lati = 2;
    lunghezza_braccio = 2;
    altezza_eli = 0;

    % Coordinate del centro del cubo
    y = 0;

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
    rotazione_pitch = [+cos(theta),          0,     +sin(theta);
                                0,           1,               0; 
                       -sin(theta),          0,     +cos(theta)];

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
    disegna_elica(x, y, z, +lunghezza_braccio, altezza_eli, theta);
    disegna_elica(x, y, z, -lunghezza_braccio, altezza_eli, theta);

    title("Plot of Drone Control");
    xlim([-10 10]);
    ylim([-10 10]);
    zlim([-5 15]);
    xlabel("X axis");
    ylabel("Y axis");
    zlabel("Z axis");
    grid on
    hold off
    
    if (strcmp(axis, "XZ") == 1)
        view(0, 0);
    elseif (strcmp(axis, "XYZ") == 1)
        view(45, 45);
    else
        view(0, 0);
    end
end

function disegna_elica(x, y, z, lunghezza_braccio, altezza_eli, theta)
    % Posizioni delle eliche
    posizione_elica = [x, y + lunghezza_braccio, z + altezza_eli];

    % Rotazione delle posizioni delle eliche in base all'angolo di pitch
    rotazione_pitch = [+cos(theta),          0,     +sin(theta);
                                0,           1,               0; 
                       -sin(theta),          0,     +cos(theta)];
    
    posizione_elica_rotata = (rotazione_pitch * posizione_elica')';

    % Raggio del cerchio dell'elica
    raggio_cerchio = 1;

    % Numero di punti per disegnare il cerchio
    num_punti = 100;

    % Angoli per disegnare il cerchio
    angoli = linspace(0, 2*pi, num_punti);

     % Applica la rotazione ai punti del cerchio
    cerchio_rotato = rotazione_pitch * [raggio_cerchio * cos(angoli); raggio_cerchio * sin(angoli); zeros(1, num_punti)];

    % Trasla i punti del cerchio alla posizione corretta
    cerchio_rotato = bsxfun(@plus, cerchio_rotato, posizione_elica_rotata');

    % Disegna il cerchio
    plot3(cerchio_rotato(1, :), cerchio_rotato(2, :), cerchio_rotato(3, :), 'r-', 'LineWidth', 2);

end

