% Read color image 
RGB = imread('flower.png');
figure;
subplot(2, 3, 1);
imshow(RGB);
title('Original Image');
imresize(RGB,2);
f1=imresize(imresize(RGB,1/2),2);
subplot(2, 3, 2), imshow(f1)
title('128X128 Resolution ');
f2=imresize(imresize(RGB,1/4),4);
subplot(2, 3, 3), imshow(f2)
title('64X64 Resolution ');
f3=imresize(imresize(RGB,1/8),8);
subplot(2, 3, 4), imshow(f3)
title('32X32 Resolution ');
f4=imresize(imresize(RGB,1/16),16);
subplot(2, 3, 5), imshow(f4)
title('16X16 Resolution ');
f5=imresize(imresize(RGB,1/32),32);
subplot(2, 3, 6), imshow(f5)
title('8X8 Resolution ');
