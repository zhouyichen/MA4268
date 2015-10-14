function m = fft2d(m)
    [height, width] = size(m);
    rows = num2cell(m, 1);
    rows = bitrevorder(rows);
    m = cell2mat(rows);
    rows = num2cell(m, 2);
    rows = bitrevorder(rows);
    m = cell2mat(rows);
    for r = 1 : height
        m(r, :) = fft1d(m(r, :), width);
    end
    for r = 1 : width
        m(:, r) = fft1d(m(:, r), height);
    end
end
