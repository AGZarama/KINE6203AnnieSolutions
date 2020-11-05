function [maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(SubjectID, Gender, Day1, Day2, Day3)
% function: genderIsoCalc
% This function analyzes a dataset of isometric strength data across three
% days for a group of participants. It takes as input SubjectID, subject
% Gender, and isometric strength data per subject on Day1, Day2, and Day3.
% Outputs are: two 2-column matrices listing SubjectID (column1) and
% corresponding average isometric strength data per participant across all
% three days (column2), one for only male subjects (titled maleIsoIndMeans)
% and one for only females (titled femaleIsoIndMeans), as well as total
% averages for all isometric strength data for males (titled
% maleGroupIsoMean) and for females (titled femaleGroupIsoMean).

% Inputs are ordered: SubjectID, Gender, Day1, Day2, and Day3.
%%


% This first section counts the total instances of male and female inputs in order to
% create the variable vectors.

% Male and female subject counter is set to zero. The for loop adds 1 to
% the male and female counts for each occurance, calculating the total of
% each.

totalMales = 0;
totalFemales = 0;

for i = 1 : (length (SubjectID) )
    if Gender (i) == 'M'
        totalMales = totalMales + 1;
    elseif Gender (i) == 'F'
        totalFemales = totalFemales + 1;
    else 
        errorID = SubjectID (i)
        disp ' This subject has no useable Gender Value'
    end
end


% This next section creates column vectors for male and female subject IDs
% and mean strength data per participant. 

% This preallocates vectors for male and female subjectIDs and male and
% female individual mean strength data.
maleIDs = zeros (totalMales, 1);
femaleIDs = zeros (totalFemales, 1);
maleMeans = zeros (totalMales, 1);
femaleMeans = zeros (totalFemales, 1);


% This sets the counters for male and female subject IDs (mID and fID) and
% male and female individual means (mMean and fMean) to zero, representing row zero
% for each at the start of the loop.
mID = 0;
fID = 0;
mMean = 0;
fMean = 0;


% This for loop fills the male and female subject ID and mean strength
% vectors. Each iteration of male or female subject adds 1 to the
% corresponding counter (example: mID = mID + 1) so that the new data can
% be filled into the appropraite line.
for i = 1 : (length (SubjectID) )
    if Gender (i) == 'M'
        mID = mID + 1;
        maleIndID = SubjectID (i);
%         This fills the appropriate line of the maleIDs vector with
%         the SubjectID(i).
        maleIDs (mID) = maleIndID;
        mMean = mMean + 1;
%         This creates a vector for subject(i)'s daily strength data.
        indMeanVector = [ Day1(i), Day2(i), Day3(i) ];
%         This finds the mean of the three strength values.
        indMean = mean( indMeanVector );
%         This fills the appropriate line of the maleMeans vector with
%         the mean strength data.
        maleMeans (mMean) = indMean;
    elseif Gender (i) == 'F'
        fID = fID + 1;
        femaleIndID = SubjectID (i);
        femaleIDs (fID) = femaleIndID;
        fMean = fMean + 1;
        indMeanVector = [ Day1(i), Day2(i), Day3(i) ];
        indMean = mean( indMeanVector );
        femaleMeans (fMean) = indMean;
    end
end
     

% This creates matrices for males and females, respectively, with column 1
% listing SubjectIDs and column 2 listing average strength data per
% participant over the three testing days.
maleIsoIndMeans = [ maleIDs, maleMeans];
femaleIsoIndMeans = [ femaleIDs, femaleMeans];


% This calculates the total mean strength value for males and females,
% respectively, using the maleMeans and femaleMeans vectors.
maleGroupIsoMean = mean (maleMeans);
femaleGroupIsoMean = mean (femaleMeans);


end

