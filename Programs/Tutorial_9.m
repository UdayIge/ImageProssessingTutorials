clc;
% Read the image
x = imread('tulip.png');
% Display the original image
figure, imshow(x);
% Perform Discrete Cosine Transform (DCT) on the image
x = rgb2gray(x);  % Convert to grayscale if needed
F = dct2(double(x));  % Apply DCT after converting to double
%F = dct2(x);
% Display the transformed Image
figure, imshow(F*0.01); 
% the transformed im Perform inverse Discrete cosine Transform (IDCT) on
ff=idct2(F);
% Display the reconstructed image
figure, imshow (ff/255);
[r,c] = size(x);
DF = zeros (r,c);
DFF=DF;
IDF = DF;
IDFF = DF;
depth=4;
N=8;
for i=1:N:r-N+1
    for j=1:N:c-N+1
        % Expact block from the image.
        f=x(i:i+N-1,j:j+N-1);
        % Perform DCT on the block
        df = dct2(f);
        DF(i:i+N-1,j:j+N-1) = df;
        % Store DCT coefficients.
        % per Form. IDCT on the DCT coefficients.
        dff = idct2(df);
        DFF (i:i+ N-1, j:j+ N-1)= dff;
        %Store reconstructed block.
        %consider depth for DCT coefficients.
        dF(N:-1: depth +1,:)=0;
        df (:, N:- depth +1)=0;
        IDF (i:i+N-1,j:j+N-1) = df;
        % Store DCT coefficients with depth considered
        % perform IDCT on the Der coefficients with depth consider
        % store reconstructed block with depth/
    end
end


% display the DCT coefficients and reconstructed images
figure, imshow(DF/255);
title ('DCT coefficients');
figure, imshow(DFF/255);
title ('Reconstructed Image');
figure, imshow (IDF/255);
title ('DCT Coefficients with Depth considered');
figure, imshow(IDFF/255);
title ('Reconstructed Image with Depth considered');

% Write the reconstructed images to files.
%imread imwrite (uint8 (DFF), 'abcl.tif');
%imwrite (uint8 (IDFF), 'abc2.tif');
