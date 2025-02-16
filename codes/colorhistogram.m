 %Split into RGB Channels
    image1=imread("black_ball_white_back1.jpg");
    scale_factor=1/4;
    
    image= imresize(image1, scale_factor);
    Red = image(:,:,1);
    Green = image(:,:,2);
    Blue = image(:,:,3);
    
    Red(Red>100)=0;
    Green(Green>100)=0;
     Blue(Blue>100)=0;
    
    Newimage(:,:,1)=Red;
    Newimage(:,:,2)=Green;
    Newimage(:,:,3)=Blue;
    
    figure()
    imshow(Newimage)
    
   figure()
   subplot(1,2,1)
   imshow(image1)
   subplot(1,2,2)
   imshow(image)
    
    
    %Get histValues for each channel
    
    [yRed, x] = imhist(Red);
    [yGreen, x] = imhist(Green);
    [yBlue, x] = imhist(Blue);
    
    
    %Plot them together in one plot
    figure()
    plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');