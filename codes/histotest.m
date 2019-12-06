%close all
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
    x=390;
    y=165;
    mask(x:x+200,y:y+200)=1;
    mask=uint8(mask);
    
    masked_image=mask.*I;
    masked_image_part=masked_image(x:x+200,y:y+200);
    subplot(3,2,1)
    imshow(masked_image_part)
    title('ref')
    subplot(3,2,2)
    imhist(masked_image_part);
    hist1=imhist(masked_image_part);
    
    
    
    mask=zeros(sz);
    x=390;
    y=110;
    mask(x:x+200,y:y+200)=1;
    mask=uint8(mask);
    
    masked_image=mask.*I;
    masked_image_part=masked_image(x:x+200,y:y+200);
    subplot(3,2,3)
    imshow(masked_image_part)
    title('input hist')
    hist2=imhist(masked_image_part);
    subplot(3,2,4)
    imhist(masked_image_part);
    
    [costvalue,costs]=histogram_matching(hist2,hist1,"none",[1,90]);
    subplot(3,2,5)
    plot(costs)
    title(["costvalue= ",num2str(costvalue)])
    
    
    
    
     