function m = ifft2d(m)
    [height, width] = size(m);
    m = m( : , bitrevorder(1 : width)); % bit-reversal on columns
    m = bitrevorder(m); % bit-reversal on rows
    if height == width % optimised method for this case
        power = 1;
        while height > power
            step = power * 2;
            e_theta = exp((0 : power - 1 ) * 1i * (2 * pi / step));
            for start = 1 : power
                for a = start : step : height
                    b = a + power;
                    % update the values for the rows
                    temp = m(b, :) * e_theta(start);
                    m(b, :) = m(a, :) - temp;
                    m(a, :) = m(a, :) + temp;
                    % update the values for the columns
                    temp = m(:, b) * e_theta(start);
                    m(:, b) = m(:, a) - temp;
                    m(:, a) = m(:, a) + temp;
                end
            end
            power = step;
        end
        m = m / (height * width);
    else % height is not equal to width
        m = fft1d(m, height, 1); % fft the rows
        m = fft1d(m, width, 0); % fft the columns
    end
end

function output = ifft1d(output, N, rows)
    power = 1;
    while N > power
        step = power * 2;
        e_theta = exp((0 : power - 1 ) * 1i * (2 * pi / step));
        for start = 1 : power
            for a = start : step : N
                b = a + power;
                if rows == 1 % fft on rows
                    temp = output(b, :) * e_theta(start);
                    output(b, :) = output(a, :) - temp;
                    output(a, :) = output(a, :) + temp;
                else % fft on columns
                    temp = output(:, b) * e_theta(start);
                    output(:, b) = output(:, a) - temp;
                    output(:, a) = output(:, a) + temp;
                end
            end
        end
        power = step;
    end
    output = output/N;
end