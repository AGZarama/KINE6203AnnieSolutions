function [vectorPlot] = plotVectors (vector1, vector2 )
% This function accepts two vectors as input. The two vectors must be of the 
% same length. They must each be input as j:i:k, where j is the first value, k is 
% the last value, and i is the increment between all values.
%
% Example:
% >> plotVectors( [1:1:20], [5:2:45] )
%
% It then plots both vectors as line graphs on the same plot. Title is "Vector1 
% vs Vector2," % x-axis label is "Number of M&Ms % in my snack jar," y-axis label 
% "My excitement to clean my house," and legend is % "vector1," and "vector2."
% Output is the plot and a message to see plot window.

plot (vector1)
hold on
plot (vector2)
hold off
title ('Vector1 vs Vector2')
xlabel ('Number of M&Ms in my snack jar')
ylabel ('My excitement to clean my house')
legend ('vector 1', 'vector2')

vectorPlot = 'Please see plot window';

end

