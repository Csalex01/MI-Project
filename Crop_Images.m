clear;
close all;

load("labeled_images.mat");

%% Tanítóhalmaz betöltése

image_files = gTruth.DataSource.Source;

disp("Létező címkék:");
disp(" ");
disp(gTruth.LabelDefinitions);

%% Képek betöltése

training_set = {};
labels = {};

%% Címkézett képek mentése

disp("Kivágott képek mentése folyamatban...");

%% Címke: Corn

mkdir Training_Set/Corn;

% Adathalmaz bejárása
for i = 1 : length(image_files)
    
    % Kurrens kép beolvasása
    training_set{i} = imread(image_files{i});

    % A képhez tartozó "Corn" címkék betöltése
    labels{i} = gTruth.LabelData.Corn{i};

    % Kurrens kép illetve címke elmentése
    curr_image = training_set{i};
    curr_labels = labels{i};

    % Címkék bejárása
    for j = 1 : length(curr_labels)

        % Négyzet paraméterei
        x = curr_labels(j, 1);  % X pozíció
        y = curr_labels(j, 2);  % Y pozíció
        w = curr_labels(j, 3);  % Szélesség
        h = curr_labels(j, 4);  % Magasság
        
        % Alkép kivágása a kurrens képből
        img = curr_image(y : y + h, x : x + w, 1 : 3);
        
        % Kép mentése a "Training_Set/Corn" könyvtárba
        filename = "Corn_" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Corn", filename);

        imwrite(img, file);

    end

end

disp("Elmentve: Corn");

%% Címke: Green Onion

mkdir Training_Set/Green_Onion;

for i = 1 : length(image_files)
    
    training_set{i} = imread(image_files{i});
    labels{i} = gTruth.LabelData.Green_Onion{i};

    curr_image = training_set{i};
    curr_labels = labels{i};

    for j = 1 : length(curr_labels)

        x = curr_labels(j, 1);
        y = curr_labels(j, 2);
        w = curr_labels(j, 3);
        h = curr_labels(j, 4);
        
        img = curr_image(y : y + h, x : x + w, 1 : 3);
        
        filename = "Green_Onion_" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Green_Onion", filename);

        imwrite(img, file);

    end

end

disp("Elmentve: Green_Onion");

%% Címke: Peppers

mkdir Training_Set/Peppers;

for i = 1 : length(image_files)
    
    training_set{i} = imread(image_files{i});
    labels{i} = gTruth.LabelData.Peppers{i};

    curr_image = training_set{i};
    curr_labels = labels{i};

    for j = 1 : length(curr_labels)

        x = curr_labels(j, 1);
        y = curr_labels(j, 2);
        w = curr_labels(j, 3);
        h = curr_labels(j, 4);
        
        img = curr_image(y : y + h, x : x + w, 1 : 3);

        filename = "Peppers" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Peppers", filename);

        imwrite(img, file);

    end

end

disp("Elmentve: Peppers");

%% Címke: Pumpkin

mkdir Training_Set/Pumpkin;

for i = 1 : length(image_files)
    
    training_set{i} = imread(image_files{i});
    labels{i} = gTruth.LabelData.Pumpkin{i};

    curr_image = training_set{i};
    curr_labels = labels{i};

    for j = 1 : length(curr_labels)

        x = curr_labels(j, 1);
        y = curr_labels(j, 2);
        w = curr_labels(j, 3);
        h = curr_labels(j, 4);
        
        img = curr_image(y : y + h, x : x + w, 1 : 3);
        
        filename = "Pumpkin" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Pumpkin", filename);

        imwrite(img, file);

    end

end

disp("Elmentve: Pumpkin");

disp("Képek mentése kész!");