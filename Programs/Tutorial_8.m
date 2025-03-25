% Program:

original_image = imread('Flower.png');
gray_image = rgb2gray(original_image);

% Apply edge detection filters
sobel_filtered = edge(gray_image, 'Sobel');
prewitt_filtered = edge(gray_image, 'Prewitt');
roberts_filtered = edge(gray_image, 'Roberts');

% Display results in subplots
figure;
subplot(2,3,1), imshow(original_image), title('Original Image');
subplot(2,3,2), imshow(gray_image), title('Grayscale Image');
subplot(2,3,3), imshow(sobel_filtered), title('Sobel Filter');
subplot(2,3,4), imshow(prewitt_filtered), title('Prewitt Filter');
subplot(2,3,5), imshow(roberts_filtered), title('Roberts Filter');
