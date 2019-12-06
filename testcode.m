%testkod för jämförelse av histogram på boll och vitt område

figure()
subplot(3,2,1)
imhist(image(1:50,50:150))
title("Histogram of ball")

subplot(3,2,2)
imshow(image(1:50,50:150))
title("ball")

subplot(3,2,3)
imhist(image(100:150,100:200))
title("Histogram of area where ball is not present")


subplot(3,2,4)
imshow(image(100:150,100:200))
title("White area")

subplot(3,2,5)
imhist(image(25:75,75:175))
title("Histogram of area where there are ball and white area")


subplot(3,2,6)
imshow(image(25:75,75:175))
title("White and ball area")


