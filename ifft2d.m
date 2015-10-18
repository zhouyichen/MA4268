function m = ifft2d(m)
    [height, width] = size(m);
    cols = num2cell(m, 1);
    cols = bitrevorder(cols);
    m = cell2mat(cols);
    rows = num2cell(m, 2);
    rows = bitrevorder(rows);
    m = cell2mat(rows);
    m = ifft1d(m, height, 1);
    m = ifft1d(m, width, 0);
end
