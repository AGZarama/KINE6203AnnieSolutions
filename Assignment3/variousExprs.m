function [sumNumbers, differenceNumbers, productNumbers, maxNumbers] = variousExprs (number1, number2)
% This function takes two numbers as input. It then calculates the sum of
% the two numbers, the difference between them, the product between them,
% and the maximum of the two.

sumNumbers = number1 + number2;

differenceNumbers = number1 - number2;

productNumbers = number1 * number2;

if number1 > number2
    maxNumbers = number1;
elseif number1 < number2
    maxNumbers = number2;
else
    maxNumbers = number1;
    disp("These two numbers are equal")
end

end

