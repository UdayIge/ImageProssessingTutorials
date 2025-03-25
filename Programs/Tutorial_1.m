% Read in an image
clear all;
img = imread('Image.png');
imshow('Image.png');

% Get the size of the image
[height, width, channels] = size(img);
height
width
channels

% Resize the image to 50% of its original size
resized_img = imresize(img, 0.5);

% Display the resized image
figure;
imshow(resized_img);

% Crop the image
cropped_img = imcrop(img, [50 50 200 200]);
% Display the cropped image
figure;
imshow(cropped_img);

% Save the resized and cropped images
imwrite(resized_img,'resized_example.jpg');
imwrite(cropped_img,'cropped_example.jpg');

imtool(img)
imfinfo('Image.png')
