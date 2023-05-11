clear;
clc;
close all;

load("labeled_images.mat");


%% Képek betöltése

image_files = imread(fullfile("Training_Set"));

%% Képek ábrázolása

fig = figure("Name", "Training Set");
fig.Color = [ 1 1 1 ];

for i = 1 : length(image_files)
    
end