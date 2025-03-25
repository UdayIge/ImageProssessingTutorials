image = imread('Image.png'); 
if size(image, 3) == 3
    image = rgb2gray(image); 
end
F = fft2(double(image)); 
F_shifted = fftshift(F);  
[M, N] = size(image);
[U, V] = meshgrid(1:N, 1:M);
D0 = 30; 
D = sqrt((U - N/2).^2 + (V - M/2).^2);
H_low = exp(-(D.^2) / (2*(D0^2)));  
H_high = 1 - H_low; 
F_low = F_shifted .* H_low;
image_low_filtered = abs(ifft2(ifftshift(F_low)));  
F_high = F_shifted .* H_high;
image_high_filtered = abs(ifft2(ifftshift(F_high)));  
image_sharpened = double(image) - image_low_filtered; 
subplot(2, 2, 1);
imshow(image, []);
title('Original Image'); 
subplot(2, 2, 2);
imshow(image_low_filtered, []);
title('Low-pass Filtered Image'); 
subplot(2, 2, 3);
imshow(image_high_filtered, []);
title('High-pass Filtered Image'); 
subplot(2, 2, 4);
imshow(image_sharpened, []);
title('Sharpened Image');

