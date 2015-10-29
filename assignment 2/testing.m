I = double(imread('image_for_alignment.png'));
T = double(imread('image_of_template.png'));

translation = imshift(I, T);
% the result is -8 -12
% I think the results are already pretty accurate :)
display(translation);