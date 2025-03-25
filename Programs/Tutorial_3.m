clc;

RGB_IMAGE = imread('Fox.png');
DULL_IMAGE = RGB_IMAGE * 0.5;
BRIGHT_IMAGE = RGB_IMAGE *2;

figure(1), imshow(RGB_IMAGE),title('ORIGINAL Image');
figure(2), imshow(DULL_IMAGE), title('Brightness Reduced');
figure(3), imshow(BRIGHT_IMAGE),title ('Brightness Increased');

GRAY_IMAGE = rgb2gray(RGB_IMAGE);
THRESHOLDED_IMAGE = im2bw(GRAY_IMAGE,0.6);

figure(4), imshow(GRAY_IMAGE),title('Gray Image');
figure(5), imshow(THRESHOLDED_IMAGE),title('Thresholded Image');

L = 2^8;
NEGATIVE_RGB_IMAGE = (L-1) - RGB_IMAGE;
NEGATIVE_GRAY_IMAGE = (L-1) - GRAY_IMAGE;

figure(6), imshow (NEGATIVE_RGB_IMAGE),title ('Negative of RGB Image');
figure(7), imshow(NEGATIVE_GRAY_IMAGE) ,title('Negative of GRAY Image');

C = 10;
R = double (RGB_IMAGE);
S = C* log (1 + R);
LOG_TRANSFORM_IMAGE =uint8(S);
figure(8), imshow(LOG_TRANSFORM_IMAGE),title('Log Transform Image');

G = 0.6;
T = C * (R .^G);
POWER_TRANSFORMED_IMAGE = uint8(T);
figure(9), imshow(POWER_TRANSFORMED_IMAGE),title ('Power Transformed Image');
