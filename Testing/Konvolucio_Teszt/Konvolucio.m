clear;
clc;
close all;

%% Load imags

% imageFolder = fullfile(toolboxdir("vision"), "visiondata", "bookcovers");
% imds = imageDatastore(imageFolder);

% image = imread(imds.Files{floor(length(imds.Files) * rand())});
% image = imread(imds.Files{1});

image = imread('peppers.png');

%% Initialize kernel

kernel_1 = (1/18) * [
    0 0 0 1 2 ;
    0 0 1 2 1 ;
    0 1 2 1 0 ;
    1 2 1 0 0 ;
    2 1 0 0 0 ;
];

kernel_2 = (1/18) * [
    2 1 0 0 0 ;
    1 2 1 0 0 ;
    0 1 2 1 0 ;
    0 0 1 2 1 ;
    0 0 0 1 2 ;
];

%% Filter image

% image = rgb2gray(image);
filtered_1 = imfilter(image, kernel_1);
filtered_2 = imfilter(image, kernel_2);
filtered = 0.5 * filtered_1 + 0.5 * filtered_2;

%% Split image into 3 channels

[ r, g, b ] = imsplit(filtered);

%% Show the channels separately

fig = figure("Name", "Image");
fig.Color = [ 1 1 1 ];

subplot(3, 1, 1);

imshow(image);

title("Original image");

subplot(3, 1, 2);

montage({r, g, b}, "Size", [ 1 3 ]);

title("Filtered (RGB channels separately)");

subplot(3, 1, 3);

montage({filtered_1, filtered_2, filtered}, "Size", [1 3]);

title("Filtered_1 + Filtered_2 = Filtered");