function output = ifft1d(output, N, rows)
    size = 1;
    while N > size
        step = size * 2;
        e_theta = exp(1i *(2 * pi / step));
        factor = 1;
        for m = 1:size
            for a = m:step:N
                b = a + size;
                if rows == 1
                    temp = output(b, :) * factor;
                    output(b, :) = output(a, :) - temp;
                    output(a, :) = output(a, :) + temp;
                else
                    temp = output(:, b) * factor;
                    output(:, b) = output(:, a) - temp;
                    output(:, a) = output(:, a) + temp;
                end
            end
            factor = factor * e_theta;
        end
        size = step;
    end
    output = output/N;
end
