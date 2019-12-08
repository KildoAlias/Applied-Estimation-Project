clc
clear all
close all

scale_factor=1/4; %rescaling of video
rate=1;  %sample rate of videos i.e each frame or i:th frame
histheight=100; % Size of sliding histogram window
histwidth=100;
greyscale_threshold=70; %threshold for setting likely values

refimage=imread("black_ball_white_back4.jpg"); %ref image 
refimage=rgb2gray(refimage);                    % turn it grey
refimage=imresize(refimage, scale_factor); % resize


v = VideoReader("IMG_8594.MOV"); % read video

videoframes=get_videoframes(v,scale_factor, rate); %get all videoframes

for i=20%:length(videoframes)   %For each videoframe
    
    
    [fullimageidx,~,best_image_histo]=slidinghisto(videoframes{i},refimage,histwidth,histheight); % Get best part of image that resulted in best match
    best_image=threshold_likely_pixels(best_image_histo,greyscale_threshold); %set likely pixels
    idx_mass_centre=masscentre(best_image); % get masscentre
    x=fullimnageidx(1)+idx_mass_centre(1);
    y=fullimnageidx(2)+idx_mass_centre(2);
    
    figure()
    imshow(videoframes{i})
    hold on
    plot(y,x,'r+',"MarkerSize", 20)
    
    
    
    
end
