function [min_h,costmap,I] = slidinghisto(image,refimage,histwidth,histheight)
% slidinghisto(image,refimage,histwidth,histheight)
%
% Input: Frame, reference frame, width of histogram window and height of
% histogram window
% Output: y,x coordinates in min_h where the best matching histogram is,
% costmap where all values of the difference of histograms are stored and
% I, an image of the same index as the best matching histogram.

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
I=image(min_h(1):min_h(1)+histheight,min_h(2):min_h(2)+histwidth);               
end