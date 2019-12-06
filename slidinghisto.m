% IN: En frame från filmen 
% UT:  (Min tanke) matris med 1or på likely pixels (objektet), och 0 på background


function COUNT = slidinghisto(image,histwidth,histheight)

histheight=histheight-1;
histwidth=histwidth-1;

[H,W]=size(image);

for i=1:H-histheight
   
    for j=1:W-histwidth
        
        [counts, binlocations]=imhist(image(i:histheight+i,j:histwidth+j));
        image
        Part=image(i:histheight+i,j:histwidth+j)
        
       % figure()
        %imhist(image(i:histheight+i,j:histwidth+j));
        
        %figure()
        
        %subplot(1,2,1)
        %imshow(image(i:histheight+i,j:histwidth+j));
        %subplot(1,2,2)
        %imshow(image)
        
        
        COUNT{i,j}=counts;
    end
    
end






end