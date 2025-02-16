% This function performs the prediction step.

% Inputs:
%           S(t-1)            3X1
% Outputs:   
%           S_bar(t)          3X1
function [S_bar] = predict(S, R, M )
 

    % M particles 
    % N
    states=2; % x,y 
    
    S_bar(1:2,:)=S(1:2,:)+ randn(states,M).* repmat(sqrt(diag(R)),1,M); % prediction
    S_bar(3,:)=S(3,:); % passing on weights

    
end