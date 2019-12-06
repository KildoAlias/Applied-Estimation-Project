% IN: En frame från filmen 
% UT:  (Min tanke) delsteg,matris med 1or på likely pixels (objektet), och 0 på background
% alternativt koordinater till center av cluster där bollen tänks vara


function Max_likelihood = slidinghisto(image,histwidth,histheight,threshold)

histheight=histheight-1;
histwidth=histwidth-1;

[H,W]=size(image);
indx=1;
for i=1:H-histheight
   
    for j=1:W-histwidth
        
        [counts, binlocations]=imhist(image(i:histheight+i,j:histwidth+j));
        
        
       % figure()
        %imhist(image(i:histheight+i,j:histwidth+j));
        
        %figure()
        
        %subplot(1,2,1)
        %imshow(image(i:histheight+i,j:histwidth+j));
        %subplot(1,2,2)
        %imshow(image)
        
        count{i,j}=counts;  %counts är antal pixlar av varje färg 
        bins{i,j}=binlocations; %varje bin motsvarar en shade av grå
        im=image(i:histheight+i,j:histwidth+j);
        %dunno men ide här nedan, se testcode.m för tankengången kring thresholdet, threhold ish 80:
        %skapar matris med likeihood värden 1 om de är svart, 0 om de är
        % vitt, sparar sedan varje delbit av bilden för att kunna ta max 
         im(im<=threshold)=1;
         im(im>threshold)=0;
       
        im_parts_likelihood(:,:,indx)=im; %verkar som ngt blir fel här :s
                                          % testa typ A=[1,2,3;4,5,6;7,8,9]
                                          % A(A<=3)=1
                                          %A(A>3)=0
                                          %så funkar de som man vill,
                                          %fattar ej riktigt vrf de blir
                                          %som de blir.
        
        %alt spara i cell
        %   imparts{i,j}=im; 
        
        
        indx=indx+1;
        
    end
    
end

Max_likelihood=max(im_parts_likelihood,[],3); 
               
                                            % Ta ut den med mest 1or= 
                                             %=bästa delbilden av bollen, 
                                             % har ej hittat hur vi får
                                             % index i 3d matrisen, samt när vi har index
                                             % måste vi associatea till
                                             % original bilden, dvs vart i
                                             % original bilden denna
                                             % delbild är located,
                                             % därefter beräkna alla
                                             % masscentrum för dessa, dvs
                                             % mittenpixeln och leverara ut
                                             % de till de filter vi vill
                                             % ha. Detta är iaf min tanke?
                                           
                                      




end