% This function calcultes the weights for each particle based on the
% observation likelihood
%           S_bar(t)            3XM % M= number of particles 
%        
% Outputs: 
%           S_bar(t)            3XM


function S_bar = weight(S_bar, measurement,Q,outlier_threshold)
        
       
       Psi = exp(-0.5 * ((measurement(1) - S_bar(1,:)).^2/Q(1) + (measurement(2) - S_bar(2,:)).^2 / Q(4)));
       
    if isnan(Psi)|| mean(Psi)<outlier_threshold
        
        S_bar(3,:)=1/length(Psi);
        
        
    else
     
        
       S_bar(3,:)=Psi/sum(Psi);
       
       
       
    end
       
    
      
end
