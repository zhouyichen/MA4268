function m = ifft2d(m)
    [height, width] = size(m);
    m = m(:,bitrevorder(1:width));
    m = bitrevorder(m);
    N = max(height, width);
    power = 1;
    while N > power
        step = power * 2;
        e_theta = exp((0:power-1) * 1i *(2 * pi / step));
        for start = 1:power
            for a = start:step:N
                b = a + power;
                if power < height && b <= height
                    temp = m(b, :) * e_theta(start);
                    m(b, :) = m(a, :) - temp;
                    m(a, :) = m(a, :) + temp;
                end
                if power < width && b <= width
                    temp = m(:, b) * e_theta(start);
                    m(:, b) = m(:, a) - temp;
                    m(:, a) = m(:, a) + temp;
                end;
            end
        end
        power = step;
    end
    m = m/(width * height);
end
