


figure()
for i=1:length(pointer_pos)
    
    pos=pointer_pos{i};
    
  subplot(3,5,i)
  imshow(imagge{i})
  hold on
  
  
  plot(pos(1),pos(2),'r+','MarkerSize',20)
    
    
    
end
