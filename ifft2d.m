function m = ifft2d(m)
    [height, width] = size(m);
    m = m(:,bitrevorder(1:width));
    m = bitrevorder(m);
    m = ifft1d(m, height, 1);
    m = ifft1d(m, width, 0);
end
