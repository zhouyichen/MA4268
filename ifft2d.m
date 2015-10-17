function m = ifft2d(m)
    [height, width] = size(m);
    cols = num2cell(m, 1);
    cols = bitrevorder(cols);
    m = cell2mat(cols);
    rows = num2cell(m, 2);
    rows = bitrevorder(rows);
    m = cell2mat(rows);
    for r = 1 : height
        m(r, :) = ifft1d(m(r, :), width);
    end
    for r = 1 : width
        m(:, r) = ifft1d(m(:, r), height);
    end
end
