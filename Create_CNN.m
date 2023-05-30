clear;
clc;
close all;

load("max_sizes.mat");

%% Tanítóhalmaz betöltése

% Adathalmaz betöltése, címkék forrása a könyvtáraknak a neve.
dataPath = fullfile("Training_Set_Padded");
data = imageDatastore(dataPath, "IncludeSubfolders", true, "LabelSource", "foldernames");

%% Adatok címkézése

% Osztályonkénti címkék megszámolása
labelCount = countEachLabel(data);

%% Tanítóhalmaz és teszthalmaz meghatározása

% Adathalmaz osztása tanító halmazra (75%) illetve validációs halmazra (25%).
trainingPercentage = 0.75;
[ trainingData, validationData ] = splitEachLabel(data, trainingPercentage, 'randomized');

%% CNN rétegek meghatározása

layers = [

    % Bemeneti réteg: max_height * max_width * 3 (3 = RGB)
    imageInputLayer([max_height max_width 3], 'Name', 'Bemeneti Réteg')

    % 1. Konvolúciós réteg (2D): 10x10, 20db
    convolution2dLayer(10, 20, 'Padding', 1, 'Name', 'Konvolúciós Réteg #1')

    % Normalizációs réteg
    batchNormalizationLayer('Name', 'Batch Réteg #1')

    % ReLU réteg
    reluLayer('Name', 'ReLU Réteg #1')

    % Max Pooling Layer (2D): 10x10
    maxPooling2dLayer(10, 'Stride', 2, 'Name', 'MaxPool Réteg #1')

    % Konvolúciós réteg (2D): 5x5, 64db
    convolution2dLayer(5, 64, 'Padding', 1, 'Name', 'Konvolúciós Réteg #2')

    % Normalizációs réteg
    batchNormalizationLayer('Name', 'Batch Réteg #2')

    % ReLU réteg
    reluLayer('Name', 'ReLU Réteg #2')

    % Max Pooling Layer (2D): 10x10
    maxPooling2dLayer(10, 'Stride', 2, 'Name', 'MaxPool Réteg #2')

    % Konvolúciós réteg (2D): 3y3, 64db
    convolution2dLayer(3, 64, 'Padding', 1, 'Name', 'Konvolúciós Réteg #3')

    % Normalizációs réteg
    batchNormalizationLayer('Name', 'Batch Réteg #3')

    % ReLU réteg
    reluLayer('Name', 'ReLU Réteg #3')

    % Teljesen csatolt réteg (MLP)
    fullyConnectedLayer(4, 'Name', 'Teljesen Összecsatolt Réteg')

    % Softmax réteg
    softmaxLayer('Name', 'SoftMax Réteg')

    % Osztályozó réteg
    classificationLayer('Name', 'Osztályozó Réteg')
];

%% Konvolúciós neuronháló tanítása

% Tanítási paraméterek meghatározása
options = trainingOptions('adam',  ...
    'MaxEpochs', 50, ...
    'ValidationData', validationData, ...
    'ValidationFrequency', 10, ...
    'Verbose', true, ...
    'Plots', 'training-progress');

% Konvolúciós neuronháló tanítása
net = trainNetwork(trainingData, layers, options);


