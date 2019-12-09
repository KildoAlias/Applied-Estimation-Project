clc
clear all
close all

%Parameters for CV
    scale_factor=1/5; %rescaling of video
    rate=1;  %sample rate of videos i.e each frame or i:th frame
    histheight=200; % Size of sliding histogram window
    histwidth=200;
    greyscale_threshold=50; %threshold for setting likely values
    
%Parameters for tracking
    M=1000; % Particles 
    Q=[1,0;0,1]; %Measurement noise
    R=[1,0;0,1]; %Process noise
    outlier_threshold= 0.001; 
    Resample_mode=1; % 1 for multinomial, 0 for systemartic
    
    

refimage=imread("black_ball_white_back4.jpg"); %ref image 
refimage=rgb2gray(refimage);                    % turn it grey
refimage=imresize(refimage, scale_factor); % resize


v = VideoReader("IMG_8594.MOV"); % read video


[H,W,videoframes,~]=get_videoframes(v,scale_factor, rate); %get all videoframes

S_bar(1,:)=randi([1,H],1,M);    %Initializing S_bar
S_bar(2,:)=randi([1,W],1,M);
S_bar(3,:)=1/M;


k=1;
for i=1:length(videoframes)   %For each videoframe
    
    
    [fullimageidx,~,best_image_histo]=slidinghisto(videoframes{i},refimage,histwidth,histheight); % Get best part of image that resulted in best match
    best_image=threshold_likely_pixels(best_image_histo,greyscale_threshold); %set likely pixels
    measurement=masscentre(best_image); % get masscentre
    
    S_bar=predict(S_bar, R, M );
    S_bar=weight(S_bar, measurement,Q,outlier_threshold);
    
    switch Resample_mode
        case 1
            S_bar=multinomial_resample(S_bar,M);
            
        case 2
           S_bar= systematic_resample(S_bar,M);
    end
           
     Prediction=round(mean(S_bar(1:2,:)));
    
    
    
    
    
    
    
%     figure()
%     imshow(videoframes{i})
    
    
    
%     if isnan(idx_mass_centre)~=1    
%         x=fullimageidx(1)+idx_mass_centre(1);
%         y=fullimageidx(2)+idx_mass_centre(2);
%         pointer_pos{k}=[y,x];
%         imagge{k}=videoframes{i};
%         hold on
%         plot(y,x,'r+','MarkerSize',20)
%         k=k+1;
%     end
%     
 
  
end



