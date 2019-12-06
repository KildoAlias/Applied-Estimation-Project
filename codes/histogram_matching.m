function [costvalue,costs]=histogram_matching(hist,refhist,thresholdfunction,threshold) 
% histogram_matching(hist,refhist,thresholdfunction,threshold)
%
% Performes histogram matching by taking the minimum sliding difference
% between a histogram ("hist") and a reference histogram ("refhist").
% Returns a costvalue that represents the correlation (0 for identical histograms, 1 for completely different)
%
% The histogram can be cut by "thresholdfunction" if only a smaller part of
% the histogram is to be checked ("lowpass","highpass","flat"), otherwise choose "none" for full
% histogram. Option "none" should be invariant to difference in lighting 
%
% "threshold" decides the threshold to be cut, must be vector of dim 1X2, (lower, upper)

if nargin<3 || nargin<4 || thresholdfunction== "none" 
    g=ones(1,256);
elseif threshold(1)<1 || threshold(2)>256 || threshold(1)>threshold(2)
    g=ones(1,256);
    disp('Warning: threshold funtion set to "none", invalid threshold values (1-256)')
elseif thresholdfunction== "lowpass"
    g=zeros(1,256);
    g(threshold(1):threshold(2))=threshold(2):-1:threshold(1);

elseif thresholdfunction== "highpass"
    g=zeros(1,256);
    g(threshold(1):threshold(2))=threshold(1):1:threshold(2);

elseif thresholdfunction=="flat"
    g=zeros(1,256);
    g(threshold(1):threshold(2))=1;

end

    l=length(hist);
    % Limiting the range of histogram by threshold
    refhist=g'.*refhist;
    hist=g'.*hist;
    
    % Extending histogram vectors to be able to perform slide
    hist_slide=zeros(1,3*l);
    refhist_slide=zeros(1,3*l);
    refhist_slide(l+1:2*l)=refhist;
    hist_slide(1:l)=hist;
    

    % Normalize histograms
    refhist_slide=refhist_slide/sum(refhist_slide);
    hist_slide=hist_slide/sum(hist_slide);
    
    % Initilizing costs vector
    costs=ones(1,(length(hist_slide)-1))*inf;
    % calculate sliding difference between histograms
    for i=1:(length(hist_slide)-1)
        diff=abs(hist_slide-refhist_slide);
        % divide by 2 to get normalization (two histograms)
        costs(i)=sum(diff)/2;
        % Shift the histogram one step
        hist_slide=circshift(hist_slide,1);
    end
    % Returns minimum cost value of histograms (least difference between histograms)
    costvalue=min(costs);
end