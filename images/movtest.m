clc
clear all
close all

scale_factor=1/4;
rate=10;

  
v = VideoReader("IMG_8580.MOV");

numberofframes=v.NumberOfFrames-2;  %130 frames
Totalframes=numberofframes/rate;
mov=cell(Totalframes,1);

k=1;
for i=1:rate:numberofframes
    videoframe=read(v,i);
    videoframe=imresize(videoframe, scale_factor);
    image=rgb2gray(videoframe);
    
  [H,W]=size(image);
  
  
    
    %1) läst in video, kan välja skalningsfaktor och antal frames
    %2)för varje frame utför sliding color histogram
    %3) predicta samt markera position
    
    
    mov{k}=videoframe;
    
    k=k+1;
end

%movie(:,:,:,k)=videoframe;
%implay(movie,30)             %Om implay ska funka annars de nedan

%for i=1:length(mov)
 %   imshow(mov{i})
  %  pause(0.001)
    
%end
