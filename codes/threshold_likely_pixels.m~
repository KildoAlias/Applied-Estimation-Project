function likely_matrix = threshold_likely_pixels(matrix,greyscale_threshold)

%Input: matrix with greyscale values
%Output: same matrix but with zeros and ones

matrix(matrix<=greyscale_threshold)=1; %set likely pixels to one depending on greyscale_threshold
matrix(matrix>greyscale_threshold)=0;


likely_matrix=matrix;
end
