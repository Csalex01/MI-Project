clear;
clc;
close all;

load("max_sizes.mat");

%% Tanítóhalmaz betöltése

dataPath = fullfile("Training_Set_Padded");
data = imageDatastore(dataPath, "IncludeSubfolders", true, "LabelSource","foldernames");

%% Adatok címkézése

labelCount = countEachLabel(data);

%% Tanítóhalmaz és teszthalmaz meghatározása

trainingNumFiles = 52; % 25% teszthalmaz, többi tanítóhalmaz
[ trainingData, validationData ] = splitEachLabel(data, trainingNumFiles, 'randomized');

%% CNN rétegek meghatározása

% layers = [
%     imageInputLayer([max_height max_width 3], 'Name', 'Bemeneti Réteg')
%     convolution2dLayer(20, 20, 'Padding', 1, 'Name', 'Konvolúciós Réteg #1')
%     batchNormalizationLayer('Name', 'Batch Réteg #1')
%     reluLayer('Name', 'ReLU Réteg #1')
%     maxPooling2dLayer(10, 'Stride', 2, 'Name', 'MaxPool Réteg #1')
%     convolution2dLayer(20, 64, 'Padding', 1, 'Name', 'Konvolúciós Réteg #2')
%     batchNormalizationLayer('Name', 'Batch Réteg #2')
%     reluLayer('Name', 'ReLU Réteg #2')
%     maxPooling2dLayer(10, 'Stride', 2, 'Name', 'MaxPool Réteg #2')
%     convolution2dLayer(5, 64, 'Padding', 1, 'Name', 'Konvolúciós Réteg #3')
%     batchNormalizationLayer('Name', 'Batch Réteg #3')
%     reluLayer('Name', 'ReLU Réteg #3')
%     fullyConnectedLayer(6, 'Name', 'Teljesen Összecsatolt Réteg')
%     softmaxLayer('Name', 'SoftMax Réteg')
%     classificationLayer('Name', 'Osztályozó Réteg')
% ];

layers = [
    imageInputLayer([max_height max_width 3], 'Name', 'Bemeneti Réteg')
    convolution2dLayer(10, 20, 'Padding', 1, 'Name', 'Konvolúciós Réteg #1')
    batchNormalizationLayer('Name', 'Batch Réteg #1')
    reluLayer('Name', 'ReLU Réteg #1')
    maxPooling2dLayer(10, 'Stride', 2, 'Name', 'MaxPool Réteg #1')
    convolution2dLayer(5, 64, 'Padding', 1, 'Name', 'Konvolúciós Réteg #2')
    batchNormalizationLayer('Name', 'Batch Réteg #2')
    reluLayer('Name', 'ReLU Réteg #2')
    maxPooling2dLayer(10, 'Stride', 2, 'Name', 'MaxPool Réteg #2')
    convolution2dLayer(3, 64, 'Padding', 1, 'Name', 'Konvolúciós Réteg #3')
    batchNormalizationLayer('Name', 'Batch Réteg #3')
    reluLayer('Name', 'ReLU Réteg #3')
    fullyConnectedLayer(4, 'Name', 'Teljesen Összecsatolt Réteg')
    softmaxLayer('Name', 'SoftMax Réteg')
    classificationLayer('Name', 'Osztályozó Réteg')
];

%% Konvolúciós neuronháló tanítása

options = trainingOptions('adam',  ...
    'MaxEpochs', 60, ...
    'ValidationData', validationData, ...
    'ValidationFrequency', 1, ...
    'Verbose', true, ...
    'Plots', 'training-progress');

net = trainNetwork(trainingData, layers, options);
% net = trainRCNNObjectDetector(trainingData, layers, options);


