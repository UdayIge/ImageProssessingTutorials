clear all;
clc;

% Read input image 
I = imread('pout.tif');
% Addition of noise to the input image 
B = imnoise(I, 'salt & pepper');

%kernal of avering filter
h1=1/9*ones(3,3);
h2=1/25*ones(5,5);
% application of filter 
B1=conv2(B,h1,'same');
B2=conv2(B,h2,'same');

% display of input and output image
subplot(2,2,1),imshow(I);title('Original Image');
subplot(2,2,2),imshow(B);title('noisy image');
subplot(2,2,3),imshow(uint8(B1));title('filter noisy Image');
subplot(2,2,4),imshow(uint8(B2));title('filter image');
