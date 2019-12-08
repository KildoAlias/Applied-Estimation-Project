clc
clear all
close all

scale_factor=1/5; %rescaling of video
rate=1;  %sample rate of videos i.e each frame or i:th frame
histheight=200; % Size of sliding histogram window
histwidth=200;
greyscale_threshold=50; %threshold for setting likely values

refimage=imread("black_ball_white_back4.jpg"); %ref image 
refimage=rgb2gray(refimage);                    % turn it grey
refimage=imresize(refimage, scale_factor); % resize


v = VideoReader("IMG_8594.MOV"); % read video

videoframes=get_videoframes(v,scale_factor, rate); %get all videoframes
k=1;
for i=1:length(videoframes)   %For each videoframe
    
    
    [fullimageidx,~,best_image_histo]=slidinghisto(videoframes{i},refimage,histwidth,histheight); % Get best part of image that resulted in best match
    best_image=threshold_likely_pixels(best_image_histo,greyscale_threshold); %set likely pixels
    idx_mass_centre=masscentre(best_image); % get masscentre
    figure()
    imshow(videoframes{i})
    
    if isnan(idx_mass_centre)~=1    
        x=fullimageidx(1)+idx_mass_centre(1);
        y=fullimageidx(2)+idx_mass_centre(2);
        pointer_pos{k}=[y,x];
        imagge{k}=videoframes{i};
        hold on
        plot(y,x,'r+','MarkerSize',20)
        k=k+1;
    end
    
 
  
end



