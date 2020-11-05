function [normDay1mean, normDay2mean, normDay3mean] = wtNormData(Weight,Day1, Day2, Day3)
%Function: wtNormData
% This function calculates the mean isometric strength data per day from a
% dataset, with each entry per day normalized for weight. It can calculate
% three separate days.
%%

% This preallocates the vectors for the normalized strength data per day,
% using the length of the weight column vector for the setup.
normDay1 = zeros (length (Weight), 1);
normDay2 = zeros (length (Weight), 1);
normDay3 = zeros (length (Weight), 1);

% This fills in the vectors with normalized strength data.
for i = 1: length(Weight)
    normDay1(i) = Day1(i) / Weight(i);
    normDay2(i) = Day2(i) / Weight(i);
    normDay3(i) = Day3(i) / Weight(i);

% This finds mean weight-normalized strength data per day.
normDay1mean = mean (normDay1);
normDay2mean = mean (normDay2);
normDay3mean = mean (normDay3);

end

