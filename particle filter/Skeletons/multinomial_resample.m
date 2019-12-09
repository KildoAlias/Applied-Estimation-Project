% This function performs multinomial re-sampling
% Inputs:   
%           S_bar(t):       3XM
% Outputs:
%           S(t):           3XM
function S = multinomial_resample(S_bar,M)

    S=zeros(3,M);
    CDF=cumsum(S_bar(3,:)); 
    r=rand(1,M);

    for m=1:M
        CDF_temp=CDF;
        CDF_temp(CDF_temp<r(m))=inf;
        [~,i]=min(CDF_temp);
        S(1:2,m)=S_bar(1:2,i);
    end
    
    S(3,:)=(1/M)*ones(1,M);




% 
%     S=zeros(size(S_bar));
%     CDF=cumsum(S_bar(3,:));
%     
%     for m=1:M
%         r=rand;
%         i=find(CDF>=r, 1 );
%         S(:,m)=S_bar(:,i);
%         S(3,m)=1/M;
%     end


end
