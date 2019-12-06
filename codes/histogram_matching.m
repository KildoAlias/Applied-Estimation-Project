 %Split into RGB Channels
    close all
    image=imread('black_ball_white_back1.jpg');
    Red = image(:,:,1);
    Green = image(:,:,2);
    Blue = image(:,:,3);
   
    %Get histValues for each channel
    %[yRed, x] = imhist(Red);
    %[yGreen, x] = imhist(Green);
    %[yBlue, x] = imhist(Blue);
  
    I=rgb2gray(image);
    I=imresize(I,0.5);
    thres=70;
    idx=I>thres;
    
    sz=size(I);
   % I=single(I);
    mask=zeros(sz);
    x=350;
    y=280;
    mask(x:x+200,y:y+200)=1;
    mask=uint8(mask);
    
    masked_image=mask.*I;
    masked_image_part=masked_image(x:x+200,y:y+200);
    
    figure()
    subplot(1,2,1)
    imhist(masked_image)
    subplot(1,2,2)
    imshow(masked_image)
    %Plot them together in one plot
    %figure()
    %plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');