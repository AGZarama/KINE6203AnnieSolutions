function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Annie Zarama
%
%         DUE: November 12
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

while level ~= beginner && level ~= moderate && level ~= advanced   %Found bug 1: Stuck in infinite loop by using ||. Fixed with &&. Found by running the script and getting stuck in loop.
    fprintf('Sorry, that is not a valid level selection.\n')
    level = input('Please re-enter a level of play (1-3): ');
end


% set highest secret number based on level selected
if level == beginner  %Found bug 2: only used one "=" but needs to be "==". Found by running the script and getting an error for this line.
    highest = beginnerHighest;
elseif level == moderate
    highest = moderateHighest;
else
    highest = advancedHighest;   %Found bug 3: spelling error "advancedhighest". Corrected to "advancedHighest". Found by reading through the script.
end


% randomly select secret number between 1 and highest for level of play
secretNumber = floor(rand() * highest);  %Found bug 4: expression contained a "+1" to the random number but this would generate a number outside of the specified range when multiplied by 10. Removed "+1". Found by playing script and never correctly guessing the number in the beginner (1-10) range.   


% initialize number of guesses and User_guess
numOfTries = 0; %Found bug 10: numOfTries was incorrectly set to 1. Found by running script and seeing the inaccurate value.
userGuess = 0;


% repeatedly get user's guess until the user guesses correctly
while userGuess ~= secretNumber
    
    % get a valid guess (an integer from 1-Highest) from the user
    fprintf('\nEnter a guess (1-%d): ', highest);
    userGuess = input('');
    
    % add 1 to the number of guesses the user has made
    numOfTries = numOfTries + 1; 
    
    while userGuess < 1 || userGuess > highest    % Found bug 5: upper limit of userGuess was set to ">=" highest, instead of ">". Found by running script and trying to guess numbers around, at, and over the limit.
        fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);
        userGuess = input('');
    end %Found bug 7: missing end to while loop. Found by reading script.

    % report whether the user's guess was high, low, or correct
    %Found bug 8: secret number statment evaluation needed to be within the while loop for incorrect guesses.
    if userGuess < secretNumber   %Found bug 6: incorrectly written as "> secretNumber" instead of "<". Found by reading through script.
        fprintf('Sorry, %d is too low.\n', userGuess);
    elseif userGuess > secretNumber 
        fprintf('Sorry, %d is too high.\n', userGuess);
    end
     
end % of guess validation as incorrect loop


while userGuess == secretNumber   %Found bug 11: correct guess evaluation could not be housed within incorrect guess while loop. Found by reading script.
    if numOfTries == 1 
        fprintf('\nLucky You!  You got it on your first try!\n\n');
        fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
        break
    elseif numOfTries > 1
        fprintf('\nCongratulations!  You got %d in %d tries.\n\n', secretNumber, numOfTries);    %Found bug 9: needed to include numOfTries variable in expression. Found by running script and seeing it missing.
        fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
        break
    end %end of correct guess response loop
    
    
end  % end of game