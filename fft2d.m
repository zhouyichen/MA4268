function m = fft2d(m)
    [height, width] = size(m);
    m = m(:,bitrevorder(1:width));
    m = bitrevorder(m);
    m = fft1d(m, height, 1);
    m = fft1d(m, width, 0);
end
