% This function performs multinomial re-sampling
% Inputs:   
%           S_bar(t):       3XM
% Outputs:
%           S(t):           3XM
function S = multinomial_resample(S_bar,M)

    
    S=zeros(size(S_bar));
    CDF=cumsum(S_bar(3,:));
    
    for m=1:M
        r=rand;
        i=find(CDF>=r, 1 );
        S(:,m)=S_bar(:,i);
        S(3,m)=1/M;
    end


end
