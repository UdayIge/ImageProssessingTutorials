clear all;

% Read in the color image
RGB = imread('flower.png');
figure(1) , imshow(RGB);

% convert color in the grayscale image
A=rgb2gray(RGB);
figure(2), imshow(A);

% convert color in the binary image
D=imadjust(RGB,[0 1],[1 0]);
figure(3), imshow(D);

C=im2bw(A);
figure(4), imshow(C);
