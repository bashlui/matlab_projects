% Tiro parabólico con múltiples proyectiles
clear all; % Limpia todas las variables previas

% Solicita al usuario el número de proyectiles
num_proyectiles = input('Introduce el número de proyectiles: ');

g = 9.81; % Aceleración constante debido a la gravedad
xo = 0; yo = 3470; % Posición inicial en x y y

% Preparar el gráfico
figure;
xlim([-5000 5000]);
ylim([0 (yo * (3/2))]);
hold on;

for i = 1:num_proyectiles
    % Valores aleatorios para velocidad y ángulo
    v = randi([100,200]);
    theta = randi([30,150]);

    % Cálculo de componentes de velocidad
    vox = v * cosd(theta); % Componente en x de la velocidad inicial
    voy = v * sind(theta); % Componente en y de la velocidad inicial

    tmax = (-voy - sqrt(voy .^2 - (4* (-4.905) * yo)))/ (2*(-4.905));

    t = linspace(0, tmax + 5, 100); % Tiempo de vuelo con mayor resolución

    % Tiro con resistencia del aire
    k = 0.2; m = 10; % Parámetros de resistencia del aire y masa
    xt = xo + (m/k) * (1 - exp(-k * t ./ m)) * vox;
    yt = yo + (m/k) * ((m * g / k) + voy) * (1 - exp(-k * t ./ m)) - (m * g * t / k);

    fprintf('Proyectil %d\nTiempo = %f s\nÁngulo = %d°\nVelocidad = %d m/s\n\n', i, tmax, theta, v);
    % Dibuja la trayectoria con resistencia del aire
    comet(xt, yt);
end

% Añadir leyendas y etiquetas
xlabel('Distancia en X');
ylabel('Altura en Y');

% Línea del suelo
yline(0, '--k');

hold off;
