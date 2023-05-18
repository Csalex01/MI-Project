clear;
close all;

load("labeled_images.mat");

%% Tanítóhalmaz betöltése

image_files = gTruth.DataSource.Source;

disp("Létező címkék:");
disp(" ");
disp(gTruth.LabelDefinitions);

%% Képek betöltése

% fig = figure("Name", "Training Set");
% fig.Color = [ 1 1 1 ];

training_set = {};
labels = {};

%% Címkézett képek mentése

disp("Kivágott képek mentése folyamatban...");

%% Címke: Corn

mkdir Training_Set/Corn;

for i = 1 : length(image_files)
    
    training_set{i} = imread(image_files{i});
    labels{i} = gTruth.LabelData.Corn{i};

    curr_image = training_set{i};
    curr_labels = labels{i};

    for j = 1 : length(curr_labels)

        x = curr_labels(j, 1);
        y = curr_labels(j, 2);
        w = curr_labels(j, 3);
        h = curr_labels(j, 4);
        
        img = curr_image(y : y + h, x : x + w, 1 : 3);
        
%         imshow(img);
%         title("Corn #" + i + "-" + j + " @(" + x + ", " + y + ")");

        filename = "Corn_" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Corn", filename);

        imwrite(img, file);

%         pause(0.25);

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
        
%         imshow(img);
%         title("Corn #" + i + "-" + j + " @(" + x + ", " + y + ")");

        filename = "Green_Onion_" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Green_Onion", filename);

        imwrite(img, file);

%         pause(0.25);

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
        
%         imshow(img);
%         title("Corn #" + i + "-" + j + " @(" + x + ", " + y + ")");

        filename = "Peppers" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Peppers", filename);

        imwrite(img, file);

%         pause(0.25);

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
        
%         imshow(img);
%         title("Corn #" + i + "-" + j + " @(" + x + ", " + y + ")");

        filename = "Pumpkin" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Pumpkin", filename);

        imwrite(img, file);

%         pause(0.25);

    end

end

disp("Elmentve: Pumpkin");

%% Címke: Tomato

mkdir Training_Set/Tomato;

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
        
%         imshow(img);
%         title("Corn #" + i + "-" + j + " @(" + x + ", " + y + ")");

        filename = "Tomato" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Tomato", filename);

        imwrite(img, file);

%         pause(0.25);

    end

end

disp("Elmentve: Tomato");

%% Címke: Cauliflower

mkdir Training_Set/Cauliflower;

for i = 1 : length(image_files)
    
    training_set{i} = imread(image_files{i});
    labels{i} = gTruth.LabelData.Cauliflower{i};

    curr_image = training_set{i};
    curr_labels = labels{i};

    for j = 1 : length(curr_labels)

        x = curr_labels(j, 1);
        y = curr_labels(j, 2);
        w = curr_labels(j, 3);
        h = curr_labels(j, 4);
        
        img = curr_image(y : y + h, x : x + w, 1 : 3);
        
%         imshow(img);
%         title("Corn #" + i + "-" + j + " @(" + x + ", " + y + ")");

        filename = "Cauliflower" + i + "_" + j + ".png";
        file = fullfile("Training_Set", "Cauliflower", filename);

        imwrite(img, file);

%         pause(0.25);

    end

end

disp("Elmentve: Cauliflower");

disp("Képek mentése kész!");