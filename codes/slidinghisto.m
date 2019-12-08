% IN: En frame från filmen 
% UT:  (Min tanke) delsteg,matris med 1or på likely pixels (objektet), och 0 på background
% alternativt koordinater till center av cluster där bollen tänks vara


function [min_h,costmap,I] = slow_sllide(image,refimage,histwidth,histheight)

[H,W]=size(image);

for i=1:H-histheight
   
    for j=1:W-histwidth
    
        hist=imhist(image(i:histheight+i,j:histwidth+j));
        refhist=imhist(refimage);
        costmap(i,j)=histogram_matching(hist,refhist,"none",[1,120]);
    end

end

minimum_value=min(min(costmap));
[i,j]=find(costmap==minimum_value,1);
min_h(1)=i;
min_h(2)=j;
I=image(min_h(1):min_h(1)+width,min_h(2):min_h(2)+width);               
end