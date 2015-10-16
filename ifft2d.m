function m = ifft2d(m)
    rows = num2cell(m, 1);
    rows = bitrevorder(rows);
    m = cell2mat(rows);
    rows = num2cell(m, 2);
    rows = bitrevorder(rows);
    m = cell2mat(rows);
    [height, width] = size(m);
    for r = 1 : height
        m(r, :) = ifft1d(m(r, :), width);
    end
    for r = 1 : width
        m(:, r) = ifft1d(m(:, r), height);
    end
end
