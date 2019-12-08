clc
clear all
close all

scale_factor=; %rescaling of video
rate=;          %sample rate of videos i.e each frame or i:th frame


v = VideoReader("IMG_8580.MOV");

videoframes=get_videoframes(v,scale_factor, rate);

for i=1:length(videoframes)
    %För varje videoframe
    
    slidinghisto(videoframes{i})
    
    
end
