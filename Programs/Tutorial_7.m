% Read the Image
image = imread('Image.png');
image_gray = rgb2gray(image);

% (1) Gaussian 3x3 mask for blurring
gaussian_kernel = fspecial('gaussian', [3,3], 1); 
gaussian_blur = imfilter(image_gray, gaussian_kernel, 'conv', 'replicate');

% (2) High pass filter mask with different masks
kernel_identity = [0 0 0; 0 1 0; 0 0 0];  % Identity Kernel
kernel_sharpen = [-1 -1 -1; -1 9 -1; -1 -1 -1]; % Sharpen Kernel
kernel_edge_detect = [-1 -1 -1; -1 8 -1; -1 -1 -1]; % Edge Detection Kernel

high_pass_identity = conv2(double(image_gray), kernel_identity, 'same');
high_pass_sharpen = conv2(double(image_gray), kernel_sharpen, 'same');
high_pass_edge_detect = conv2(double(image_gray), kernel_edge_detect, 'same');

% (3) Laplacian operator with positive and negative kernel values
laplacian_positive = conv2(double(image_gray), [0 1 0; 1 -4 1; 0 1 0], 'same');
laplacian_negative = conv2(double(image_gray), [-1 -1 -1; -1 8 -1; -1 -1 -1], 'same');

% (4) High boost filtering
high_boost = imfilter(image_gray, gaussian_kernel, 'conv', 'replicate');

% Display results
figure; imshow(image_gray);title('Original Image');
figure; imshow(gaussian_blur); title('Gaussian Blur');
figure; imshow(uint8(high_pass_identity)); title('High Pass Identity');
figure; imshow(uint8(high_pass_sharpen)); title('High Pass Sharpen');
figure; imshow(uint8(high_pass_edge_detect)); title('High Pass Edge Detect');
figure; imshow(uint8(laplacian_positive)); title('Laplacian (Positive)');
figure; imshow(uint8(laplacian_negative)); title('Laplacian (Negative)');
figure; imshow(uint8(high_boost)); title('High Boost Filtering');


