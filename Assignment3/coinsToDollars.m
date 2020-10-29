function [totalValue] = coinsToDollars(quarters, dimes, nickles, pennies)
% This function takes as input the numbers of quarters, dimes, nickles, and
% pennies, separately. Number of quarters are input first. Number of dimes are input second. 
% Number of nickles are input third. Number of pennies are input fourth. 
% It then calculates the total value in dollars as an output.
%
% Example, if you have 4 quarters, 4 dimes, 2 nickles, and 10 pennies,
% call function and input values as: coinsToDollars( 4, 4, 2, 10). Output
% will be $1.6.

quarters = quarters/ 4;
dimes = dimes/ 10;
nickles = nickles/ 20;
pennies = pennies/100;

total = quarters + dimes + nickles + pennies;

totalValue = strcat ('$' , num2str ( total ) );

end

