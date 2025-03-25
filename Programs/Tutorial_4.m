clear all;
clc;
% image histogram equalization
% Read color image
A = imread('cameraman.tif');
B= histeq(A);
subplot(2,2,1),imshow(A);title('Original Image');
subplot(2,2,2),imhist(A);title('Original Image histrogram');
subplot(2,2,3),imshow(B);title('histrogram Image');
subplot(2,2,4),imhist(B);title('histrogram Image histrogram');