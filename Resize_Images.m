clear;
close all;

%% Képek betöltése

corn_images = dir(fullfile("Training_Set", "Corn"));
corn_images = corn_images(3 : end, :);   % . és .. könyvtárak törlése

green_onion_images = dir(fullfile("Training_Set", "Green_Onion"));
green_onion_images = green_onion_images(3 : end, :);

peppers_images = dir(fullfile("Training_Set", "Peppers"));
peppers_images = peppers_images(3 : end, :);

pumpkin_images = dir(fullfile("Training_Set", "Pumpkin"));
pumpkin_images = pumpkin_images(3 : end, :);

%% Maximális szélesség és magasság meghatározása

disp("Képek párnázása folyamatban...")

max_width = 0;
max_height = 0;

% Corn

% Képek bejárása
for i = 1 : length(corn_images)

    % Kép megnyitása
    filename = corn_images(i).name;
    img = imread(fullfile(corn_images(i).folder, filename));
    
    % Kép méreteinek meghatározása
    [ height, width, ~ ] = size(img);

    % Ha a jelenlegi szélesség nagyobb mint az eddig tárolt maximum
    % akkor írja felöl.
    if width >= max_width
        max_width = width;
    end

    % Ha a jelenlegi magasság nagyobb mint az eddig tárolt maximum
    % akkor írja felöl.
    if height >= max_height
        max_height = height;
    end
end

% Green_Onion

for i = 1 : length(green_onion_images)
    filename = green_onion_images(i).name;
    img = imread(fullfile(green_onion_images(i).folder, filename));

    [ height, width, ~ ] = size(img);

    if width >= max_width
        max_width = width;
    end

    if height >= max_height
        max_height = height;
    end
end

% Peppers

for i = 1 : length(peppers_images)
    filename = peppers_images(i).name;
    img = imread(fullfile(peppers_images(i).folder, filename));

    [ height, width, ~ ] = size(img);

    if width >= max_width
        max_width = width;
    end

    if height >= max_height
        max_height = height;
    end
end

% Pumpkin

for i = 1 : length(pumpkin_images)
    filename = pumpkin_images(i).name;
    img = imread(fullfile(pumpkin_images(i).folder, filename));

    [ height, width, ~ ] = size(img);

    if width >= max_width
        max_width = width;
    end

    if height >= max_height
        max_height = height;
    end
end

disp("Maximális szélesség: " + max_width);
disp("Maximális magasság: " + max_height);

save("max_sizes", "max_width", "max_height");

%% Képek párnázása

% Corn

mkdir Training_Set_Padded\Corn

% Képek bejárása
for i = 1 : length(corn_images)

    % Kép beolvasása
    filename = corn_images(i).name;
    filename = fullfile(corn_images(i).folder, filename);
    img = imread(filename);
    
    % Kép méret meghatározása
    img_size = size(img);
    width = img_size(2);
    height = img_size(1);

    % Kép párnázása
    new_img = pad_image(max_width, max_height, img);
    
    % Kép elmentése
    file = fullfile("Training_Set_Padded", "Corn", "Corn_" + i + ".png");
    imwrite(new_img, file);

end

disp("Képek sikeresen újraméretezve: Corn");

% Green_Onion

mkdir Training_Set_Padded\Green_Onion

for i = 1 : length(green_onion_images)
    filename = green_onion_images(i).name;
    filename = fullfile(green_onion_images(i).folder, filename);
    img = imread(filename);
    
    img_size = size(img);
    width = img_size(2);
    height = img_size(1);

    new_img = pad_image(max_width, max_height, img);

    file = fullfile("Training_Set_Padded", "Green_Onion", "Green_Onion_" + i + ".png");
    imwrite(new_img, file);

%     imshow(new_img);
%     pause(0.25);
end

disp("Képek sikeresen újraméretezve: Green_Onion");

% Peppers

mkdir Training_Set_Padded\Peppers

for i = 1 : length(peppers_images)
    filename = peppers_images(i).name;
    filename = fullfile(peppers_images(i).folder, filename);
    img = imread(filename);
    
    img_size = size(img);
    width = img_size(2);
    height = img_size(1);

    new_img = pad_image(max_width, max_height, img);

    file = fullfile("Training_Set_Padded", "Peppers", "Peppers_" + i + ".png");
    imwrite(new_img, file);

%     imshow(new_img);
%     pause(0.25);
end

disp("Képek sikeresen újraméretezve: Peppers");

% Pumpkin

mkdir Training_Set_Padded\Pumpkin

for i = 1 : length(pumpkin_images)
    filename = pumpkin_images(i).name;
    filename = fullfile(pumpkin_images(i).folder, filename);
    img = imread(filename);
    
    img_size = size(img);
    width = img_size(2);
    height = img_size(1);

    new_img = pad_image(max_width, max_height, img);

    file = fullfile("Training_Set_Padded", "Pumpkin", "Pumpkin_" + i + ".png");
    imwrite(new_img, file);

%     imshow(new_img);
%     pause(0.25);
end

disp("Képek sikeresen újraméretezve: Pumpkin");
