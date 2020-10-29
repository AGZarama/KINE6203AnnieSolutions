function [validTriangle] = triangleArray ( arrayInput )

% This function accepts one 3-element array as input. The array must be
% entered as [ a, b, c ], where a, b, and c are each one of the three elements
% of the array. If the values of the array can be used % as lengths to make 
% a valid triangle, the output is true (0). If not, the value is false (1).
%
% Example:
% [validTriangle] = triangleArray (1, 2, 3)


side1 = min (arrayInput, [], 'all');
side2 = max (arrayInput, [], 'all');
side3 = median (arrayInput);

if side1 + side3 > side2
    validTriangle = true;
else
    validTriangle = false;
end

end

