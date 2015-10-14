function output = fft1d(output, N)
    size = 1;
    while N > size
        step = size * 2;
        e_theta = exp(- 1i *(2 * pi / step));
        factor = 1;
        for m = 1:size
            for a = m:step:N
                b = a + size;
                temp = output(b) * factor;
                output(b) = output(a) - temp;
                output(a) = output(a) + temp;
            end
            factor = factor * e_theta;
        end
        size = step;
    end
end