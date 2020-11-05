function [subImproved] = dayComparer(SubjectID, DayA, DayB)
%fucntion: dayComparer
% This function compares strength data across two consecutive days. The
% output is a matrix that lists in the first column the subject IDs for any
% subjects who increased in strength over the two days and in the second
% column, the difference between the two days. 
%
% When inputting Day input, assign the first day of interest to DayA and
% the subsequent day to DayB.
%
% Example: [day1toDay2] = dayComparer(SubjectID, Day1, Day2)
% OR
% Example: [day2toDay3] = dayComparer(SubjectID, DayA2, Day3)
%%

% This section counts the number of participants who increased in strength
% from DayA to DayB, starting the counter at zero.
count = 0;

for i = 1 : (length (SubjectID) )
    if DayB (i) > DayA (i)
        count = count + 1;
    else
    end
end


% This next section creates column vectors for subjectIDs of all who
% increased in strength from DayA to DayB (column 1) and magnitude of
% strength change (column 2). Vectors are preallocated (increaseIDs and
% dayDif) and counts (ID and subj) are set to zero at the start of the loop.

increasedIDs = zeros( count, 1);
dayDif = zeros( count, 1);

ID = 0;
subj = 0;

% A for loop is used to fill the data into the two vectors.
for i = 1 : (length (SubjectID) )
    if DayB (i) > DayA (i)
        ID = ID + 1;
        increasedIDs (ID) = SubjectID (i);
        subj = subj + 1;
        subjectDifference = DayB (i) - DayA (i);
        dayDif (subj) = subjectDifference;
    else
    end
end

% This creates the two-column matrix.
subImproved = [increasedIDs, dayDif];


end

