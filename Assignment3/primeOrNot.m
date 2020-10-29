function [primeNumber] = primeOrNot (number)
% This function accepts a single value as imput. 
% For example:
% >> primeOrNot (3)
%
% It then determines if that number is a prime number or not.
% If it is a prime number, logical true will be output.
% If it is not a prime number, logical false will be output.

if isprime(number) == true
    primeNumber = true;
else
    primeNumber = false;
    
end

