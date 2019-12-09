% This function performs systematic re-sampling
% Inputs:   
%           S_bar(t):       3XM
% Outputs:
%           S(t):           3XM
function S = systematic_resample(S_bar,M)

    
    S=zeros(size(S_bar));
    CDF=cumsum(S_bar(3,:)); 
    r=rand*(1/M);
    for m=1:M
        i=find(CDF>=r+(m-1)/M, 1 );
        S(:,m)=S_bar(:,i);
        S(3,m)=1/M;
    end

end