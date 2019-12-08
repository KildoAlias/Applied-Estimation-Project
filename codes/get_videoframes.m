function videoframes = get_videoframes(v, scale_factor, rate)
if nargin < 3
    rate=1;
end

numberofframes=v.NumberOfFrames-2;  
Totalframes=numberofframes/rate;
mov=cell(Totalframes,1);

k=1;
for i=1:rate:numberofframes
    
    videoframe=read(v,i);
    videoframe=imresize(videoframe, scale_factor);
    image=rgb2gray(videoframe); 
    mov{k}=image;
    
    k=k+1;
end
videoframes=mov;

end
