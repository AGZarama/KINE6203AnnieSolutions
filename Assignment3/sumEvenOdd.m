function [evenOdd] = sumEvenOdd(number1,number2)
% This function takes two numbers and finds their sum. 
% If the sum is an odd number, it displays "Hah".
% If the sum is an even number, it displays "Woo".
% If the sum is equal to zero, which is neither even nor odd, the message,
% 'The sum is equal to zero, which is niether even, nor odd.' is displayed

sum = number1 + number2;
sumRemainder = rem (sum, 2);

if sum == 0
    evenOdd = 'The sum is equal to zero, which is neither even, nor odd.';
else 
    if sumRemainder == 0 
        evenOdd = 'Woo';
    else
        evenOdd = 'Hah';
    end
end

end

