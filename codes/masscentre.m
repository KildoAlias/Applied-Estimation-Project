function idx_mass_centre = masscentre(matrix)
matrix=double(matrix);

%Input: Matrix with ZEROS for unlikely pixels, and ONES for likely pixels
%Output: index of 2-D masscentre of matrix 

tot_mass = sum(matrix(:)); % sums the total mass of the matrix

[ii,jj] = ndgrid(1:size(matrix,1),1:size(matrix,2)); % Index matrices for both 'x,y'
R = sum(ii(:).*matrix(:))/tot_mass; % row index for masscentre
C = sum(jj(:).*matrix(:))/tot_mass; % column index for masscentre
idx_mass_centre= [round(R),round(C)]; % output 

end




