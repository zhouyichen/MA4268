I = double(imread('satellite.png'));
F = fft2d(I);
J = ifft2d(F);
imshow(uint8(J));