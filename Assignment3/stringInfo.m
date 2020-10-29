function [stringLength, firstLetter, lastLetter] = stringInfo( stringInput )
% This function takes as input a string value and then returns the
% numerical length of the string, the first letter, and the last letter.
% Please input string as 'stringInput' with the apostrophes. 
%
% Example:
% string input is 'cactus'
% >> [stringLength, firstLetter, lastLetter] = stringInfo( 'cactus' )


stringLength = strlength( stringInput );
firstLetter = extractBefore (stringInput, 2);
lastLetter = extractAfter (stringInput, (stringLength - 1) );

end

