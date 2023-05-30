clear;
close all;

%% Képek betöltése

corn_images = dir(fullfile("Training_Set", "Corn"));
corn_images = corn_images(3 : end, :);

green_onion_images = dir(fullfile("Training_Set", "Green_Onion"));
green_onion_images = green_onion_images(3 : end, :);

peppers_images = dir(fullfile("Training_Set", "Peppers"));
peppers_images = peppers_images(3 : end, :);

pumpkin_images = dir(fullfile("Training_Set", "Pumpkin"));
pumpkin_images = pumpkin_images(3 : end, :);

%% Képek forgatása

disp("Képek tükrözése...");

% Corn

% Képek bejárása
for i = 1 : length(corn_images)

    % Kép elérési útjának meghatározása
    filename = corn_images(i).name;
    filename = fullfile(corn_images(i).folder, filename);

    % Kép betöltése
    img = imread(filename);

    % Kép tükrözése
    img = flip(img, 2);

    % Kép mentése
    file = fullfile("Training_Set", "Corn", "Corn_" + i + "_mirrored.png");
    imwrite(img, file);
end

disp("Képek elforgatva: Corn.");

% Green_Onion

for i = 1 : length(green_onion_images)
    filename = green_onion_images(i).name;
    filename = fullfile(green_onion_images(i).folder, filename);

    img = imread(filename);
    img = flip(img, 2);

    file = fullfile("Training_Set", "Green_Onion", "Green_Onion_" + i + "_mirrored.png");
    imwrite(img, file);
end

disp("Képek elforgatva: Green_Onion.");

% Peppers

for i = 1 : length(peppers_images)
    filename = peppers_images(i).name;
    filename = fullfile(peppers_images(i).folder, filename);

    img = imread(filename);
    img = flip(img, 2);

    file = fullfile("Training_Set", "Peppers", "Peppers_" + i + "_mirrored.png");
    imwrite(img, file);
end

disp("Képek elforgatva: Peppers.");

% Pumpkin

for i = 1 : length(pumpkin_images)
    filename = pumpkin_images(i).name;
    filename = fullfile(pumpkin_images(i).folder, filename);

    img = imread(filename);
    img = flip(img, 2);

    file = fullfile("Training_Set", "Pumpkin", "Pumpkin_" + i + "_mirrored.png");
    imwrite(img, file);
end

disp("Képek elforgatva: Pumpkin.");
