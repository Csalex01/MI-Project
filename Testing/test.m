clc;
% clear;
close all;

load("labeled_images.mat");

%% Tanítóhalmaz betöltése

image_datastore = imageDatastore(fullfile("Training Set", "Full Images"));
image_files = image_datastore.Files;

disp("Létező címkék:");
disp(" ");
disp(gTruth.LabelDefinitions);

%% Képek betöltése

fig = figure();
fig.Color = [ 1 1 1 ];

training_set = {};
labels = {};

for i = 1 : length(image_files)
    training_set{i} = imread(image_files{i});
    labels{i} = gTruth.LabelData.Corn{i};

    curr_image = training_set{i};
    curr_labels = labels{i};
    
    for j = 1 : length(curr_labels)
%         disp(curr_labels(j, :));

        x = curr_labels(j, 1);
        y = curr_labels(j, 2);
        w = curr_labels(j, 3);
        h = curr_labels(j, 4);

        img = curr_image(y : y + h, x : x + w, 1 : 3);
        imshow(img);

        title("Corn #" + j + " @(" + x + ", " + y + ")");

        filename = "Corn_" + i + "_" + j + ".png";
        file = fullfile("Training Set", "Cropped Images", filename);
        
%         print(img, "-dpng", "-r300", file);
%         imsave(img);

        disp("Saved file: " + file);

        pause(0.25);
    end
end
