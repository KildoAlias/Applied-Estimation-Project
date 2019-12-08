    image=imread('black_ball_white_back1.jpg');

  % reference image
    scale_factor=0.2;
    I=rgb2gray(image);
    I=imresize(I,scale_factor);

    
    refimage=imread('black_ball_white_back4.jpg');
    refimage=imresize(refimage,scale_factor);
    
    I=I(1:300,:,:);
    imshow(refimage)
    title('ref')
   
    width=50;
    [mini,costmap]=slow_sllide(I,refimage,width,width);
    I=I(mini(1):mini(1)+width,mini(2):mini(2)+width);
    
    
     