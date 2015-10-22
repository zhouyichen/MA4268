function output = fft1d(output, N, rows)
    power = 1;
    while N > power
        step = power * 2;
        e_theta = exp(- (0:power-1) * 1i *(2 * pi / step));
        for start = 1:power
            for a = start:step:N
                b = a + power;
                if rows == 1
                    temp = output(b, :) * e_theta(start);
                    output(b, :) = output(a, :) - temp;
                    output(a, :) = output(a, :) + temp;
                else
                    temp = output(:, b) * e_theta(start);
                    output(:, b) = output(:, a) - temp;
                    output(:, a) = output(:, a) + temp;
                end
            end
        end
        power = step;
    end
end