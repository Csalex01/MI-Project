clear;
clc;
close all;

%% Szükséges állományok betöltése

load("cnn_6.mat");

%% Képek betöltése

dataPath = fullfile("Training_Set_Padded");
data = imageDatastore(dataPath, "IncludeSubfolders", true, "LabelSource", "foldernames");

%% Teszt kép kiválasztása

test_image_index = round(length(data.Labels) * rand());

test_image_path = data.Files(test_image_index);
test_image_path = test_image_path{1};

test_image_label = data.Labels(test_image_index);
test_image = imread(test_image_path);

disp("Teszt kép: ");
disp("Index: " + test_image_index);
disp("Elérési út: " + test_image_path);
disp("Címke: " + string(test_image_label));

%% Tesztkép kiértékelése

prediction = classify(net, test_image);
disp("Predikció: " + string(prediction));

%% Teszt kép és predikció ábrázolása

fig = figure("Name", "Test Image");
fig.Color = [ 1 1 1 ];

imshow(test_image);
title("Label: " + string(test_image_label) + " (Prediction: " + string(prediction) + ")", 'Interpreter', 'none');