clc;
close all;
clear all;

% Read the image
x = imread('tulip.png');

% Convert to grayscale if needed
if size(x, 3) == 3
    x = rgb2gray(x);
end

% Display the original image
figure, imshow(x);
title('Original Image');

% Perform Discrete Cosine Transform (DCT) on the image
F = dct2(double(x));  

% Display the transformed Image
figure, imshow(log(abs(F)), []);
title('Transformed Image (DCT)');

% Perform inverse Discrete Cosine Transform (IDCT)
ff = idct2(F);

% Display the reconstructed image
figure, imshow(uint8(ff));
title('Reconstructed Image');

% Initialize matrices
[r, c] = size(x);
DF = zeros(r, c);
DFF = zeros(r, c);
IDF = zeros(r, c);
IDFF = zeros(r, c);

depth = 4; % Depth for DCT coefficients
N = 8; % Block size

for i = 1:N:r-N+1
    for j = 1:N:c-N+1
        % Extract block from the image
        f = double(x(i:i+N-1, j:j+N-1));
        
        % Perform DCT on the block
        df = dct2(f);
        DF(i:i+N-1, j:j+N-1) = df;
        
        % Perform IDCT on the DCT coefficients
        dff = idct2(df);
        DFF(i:i+N-1, j:j+N-1) = dff;
        
        % Consider depth for DCT coefficients
        df(depth+1:N, :) = 0;
        df(:, depth+1:N) = 0;
        IDF(i:i+N-1, j:j+N-1) = df;
        
        % Perform IDCT on the DCT coefficients with depth considered
        idff = idct2(df);
        IDFF(i:i+N-1, j:j+N-1) = idff;
    end
end

% Display the DCT coefficients and reconstructed images
figure, imshow(DF / max(DF(:)));
title('DCT Coefficients');

figure, imshow(DFF / max(DFF(:)));
title('Reconstructed Image');

figure, imshow(IDF / max(IDF(:)));
title('DCT Coefficients with Depth Considered');

figure, imshow(IDFF / max(IDFF(:)));
title('Reconstructed Image with Depth Considered');
