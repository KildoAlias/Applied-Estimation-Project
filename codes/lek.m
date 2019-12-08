function idx_mass_centre = masscentre(A)

%Input: Matrix with ZEROS for unlikely pixels, and ONES for likely pixels
%Output: index of 2-D masscentre of matrix 

tot_mass = sum(A(:)); % Ger fyra för exemplet ovan

[ii,jj] = ndgrid(1:size(A,1),1:size(A,2)); % Skapar en index matris för "x,y"
R = sum(ii(:).*A(:))/tot_mass; %Tar fram koordinat
C = sum(jj(:).*A(:))/tot_mass;
idx_mass_centre= [round(R),round(C)];

end




