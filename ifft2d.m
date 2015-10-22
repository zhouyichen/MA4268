function m = ifft2d(m)
    [height, width] = size(m);
    m = m(:,bitrevorder(1:width));
    m = bitrevorder(m);
    if height == width
        power = 1;
        while height > power
            step = power * 2;
            e_theta = exp((0:power-1) * 1i *(2 * pi / step));
            for start = 1:power
                for a = start:step:height
                    b = a + power;
                    temp = m(b, :) * e_theta(start);
                    m(b, :) = m(a, :) - temp;
                    m(a, :) = m(a, :) + temp;
                    temp = m(:, b) * e_theta(start);
                    m(:, b) = m(:, a) - temp;
                    m(:, a) = m(:, a) + temp;
                end
            end
            power = step;
        end
        m = m/(height * width);
    else
        m = ifft1d(m, height, 1);
        m = ifft1d(m, width, 0);
    end
end
