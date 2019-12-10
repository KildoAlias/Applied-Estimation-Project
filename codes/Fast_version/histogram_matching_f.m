function [costvalue,costs]=histogram_matching(hist,refhist) 
% histogram_matching(hist,refhist,thresholdfunction,threshold)
%
% Performes histogram matching by taking the minimum sliding difference
% between a histogram ("hist") and a reference histogram ("refhist").
% Returns a costvalue that represents the correlation (0 for identical histograms, 1 for completely different)
%
    
    % Initilizing costs vector
    diff=abs(hist-refhist);
    costvalue=sum(diff);

end