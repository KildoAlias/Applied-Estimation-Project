% This function calcultes the weights for each particle based on the
% observation likelihood
%           S_bar(t)            3XM % M= number of particles 
%        
% Outputs: 
%           S_bar(t)            3XM


function S_bar = weight(S_bar, measurement,Q,outlier_threshold)
        

    

        
        nu=measurement-S_bar(1:2,:);
        Psi=(1/(2*pi*det(Q)^(0.5)))*exp(-(1/2)*nu'/(Q)*nu);
        Psi=diag(Psi);
        
    if mean(Psi) < outlier_threshold %probably an outlier, or bad parameter settings
        disp("Outlier detected, ignoring measurement!");
        Psi(:) = 1;
    end       
    if mean(isnan(Psi))==1
        
        S_bar(3,:)=1/length(Psi);
        disp('No measurement!')
        
        
    else
     
        
       S_bar(3,:)=Psi/sum(Psi);
       
       
       
    end
       
    
      
end
