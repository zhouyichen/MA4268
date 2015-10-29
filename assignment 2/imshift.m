function shift = imshift(image, template)
    % line 3 to 9 is basically following the formulas in the notes
    [height, width] = size(image);
    ft_image = fft2(image);
    ft_template = fft2(template);
    R = ft_image.*conj(ft_template);
    mag_R = abs(R);
    normal_R = R./mag_R;
    r = ifft2(normal_R);
    
    % get the argmax which is an index in 1D
    [maximum, argmax] = max(r(:));
    % convert the argmax to 2D index, which is the translation
    [row, col] = ind2sub(size(r), argmax);
    
    % moderate the result such that it is within half of image size
    if row > height / 2
        row = row - height;
    end
    if col > width / 2
        col = col - width;
    end
    shift = [row, col];
end

