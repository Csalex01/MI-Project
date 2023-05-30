clear;
clc;
close all;

disp("Tanítóhalmaz előkészítése folyamatban...");

% Képek kivágása
Crop_Images;

% Tanítóhalmaz bővítése (tükrözés) -> 2x annyi adathalmaz
Expand_Training_Set;

% Képek újraméretezése és párnázása
Resize_Images;

disp("Kész!");