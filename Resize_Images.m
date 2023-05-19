clear;
close all;

load("labeled_images.mat");

%% Képek betöltése

corn_images = dir(fullfile("Training_Set", "Corn"));
corn_images = corn_images(3 : end, :);

green_onion_images = dir(fullfile("Training_Set", "Green_Onion"));
green_onion_images = green_onion_images(3 : end, :);

peppers_images = dir(fullfile("Training_Set", "Peppers"));
peppers_images = peppers_images(3 : end, :);

pumpkin_images = dir(fullfile("Training_Set", "Pumpkin"));
pumpkin_images = pumpkin_images(3 : end, :);

tomato_images = dir(fullfile("Training_Set", "Tomato"));
tomato_images = tomato_images(3 : end, :);

% cauliflower_images = dir(fullfile("Training_Set", "Cauliflower"));
% cauliflower_images = cauliflower_images(3 : end, :);

%% Maximális szélesség és magasság meghatározása

disp("Képek párnázása folyamatban...")

max_width = 0;
max_height = 0;

% Corn

for i = 1 : length(corn_images)
    filename = corn_images(i).name;
    img = imread(fullfile(corn_images(i).folder, filename));
    
    [ height, width, ~ ] = size(img);

    if width >= max_width
        max_width = width;
    end

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

% Tomato

% for i = 1 : length(tomato_images)
%     filename = tomato_images(i).name;
%     img = imread(fullfile(tomato_images(i).folder, filename));
% 
%     [ height, width, ~ ] = size(img);
% 
%     if width >= max_width
%         max_width = width;
%     end
% 
%     if height >= max_height
%         max_height = height;
%     end
% end

% % Cauliflower
% 
% for i = 1 : length(cauliflower_images)
%     filename = cauliflower_images(i).name;
%     img = imread(fullfile(cauliflower_images(i).folder, filename));
% 
%     [ height, width, ~ ] = size(img);
% 
%     if width >= max_width
%         max_width = width;
%     end
% 
%     if height >= max_height
%         max_height = height;
%     end
% end


disp("Maximális szélesség: " + max_width);
disp("Maximális magasság: " + max_height);

save("max_sizes", "max_width", "max_height");

%% Képek párnázása

% Corn

mkdir Training_Set_Padded\Corn

for i = 1 : length(corn_images)
    filename = corn_images(i).name;
    filename = fullfile(corn_images(i).folder, filename);
    img = imread(filename);
    
    img_size = size(img);
    width = img_size(2);
    height = img_size(2);

    new_img = pad_image(max_width, max_height, img);

    file = fullfile("Training_Set_Padded", "Corn", "Corn_" + i + ".png");
    imwrite(new_img, file);

%     imshow(new_img);
%     pause(0.25);
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
    height = img_size(2);

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
    height = img_size(2);

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
    height = img_size(2);

    new_img = pad_image(max_width, max_height, img);

    file = fullfile("Training_Set_Padded", "Pumpkin", "Pumpkin_" + i + ".png");
    imwrite(new_img, file);

%     imshow(new_img);
%     pause(0.25);
end

disp("Képek sikeresen újraméretezve: Pumpkin");

% Tomato

% mkdir Training_Set_Padded\Tomato
% 
% for i = 1 : length(tomato_images)
%     filename = tomato_images(i).name;
%     filename = fullfile(tomato_images(i).folder, filename);
%     img = imread(filename);
%     
%     img_size = size(img);
%     width = img_size(2);
%     height = img_size(2);
% 
%     new_img = pad_image(max_width, max_height, img);
% 
%     file = fullfile("Training_Set_Padded", "Tomato", "Tomato_" + i + ".png");
%     imwrite(new_img, file);
% 
% %     imshow(new_img);
% %     pause(0.25);
% end
% 
% disp("Képek sikeresen újraméretezve: Tomato");

% Cauliflower

% mkdir Training_Set_Padded\Cauliflower
% 
% for i = 1 : length(cauliflower_images)
%     filename = cauliflower_images(i).name;
%     filename = fullfile(cauliflower_images(i).folder, filename);
%     img = imread(filename);
%     
%     img_size = size(img);
%     width = img_size(2);
%     height = img_size(2);
% 
%     new_img = pad_image(max_width, max_height, img);
% 
%     file = fullfile("Training_Set_Padded", "Cauliflower", "Cauliflower_" + i + ".png");
%     imwrite(new_img, file);
% 
% %     imshow(new_img);
% %     pause(0.25);
% end

disp("Képek sikeresen újraméretezve: Cauliflower");
