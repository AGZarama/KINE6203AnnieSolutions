function [ counterDisp ] = numCounter(number1 ,number2)
% This function takes two values as input. The values can be written either
% (minumum, maximum) or (maximum, minimum). 
%
% Example:
% >> numCounter (2, 50)
%
% The function returns as output a list of all the integers between the 
% minimum and maximum values.


minNumber = min (number1, number2);
maxNumber = max (number1, number2);

counterDisp = [minNumber : 1: maxNumber]';

end

