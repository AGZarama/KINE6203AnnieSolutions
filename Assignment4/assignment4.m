%assignment4
%
% Author: Annie Zarama
%
% Date: 10/29/2020
%
% Description: This script imports data from an isometric strength data
% collection (including subjectID, gender, weight, and strength
% measurements from Day1, Day2, and Day3) and then analyzes it in several
% different ways. It uses outside functions to analyze data and then uses
% a built-in function to create a matrix of the function outputs. This is
% then exported under the file name 'iso_results.csv'.
%
% Developed on: MATLAB version 2020b, on Windows 10, Version 2004
%%

clear;
clc;

% This function imports data from the excel file named
% 'isok_data_6803.csv'. Data is imported as column vectors. Each vector
% variable is set to, and corresponds to, participant data regarding:
% SubjectID, Age, Gender, Weight, Day1, Day2, and Day3 isometric strength
% data.
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile( 'isok_data_6803.csv' )


% This function finds average isometric strength data across the three days per
% participant, separated into matrices for male and female participants,
% respectively, as well as the average of all male isometric strength data and the
% average of all female isometric strength data.
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(SubjectID, Gender, Day1, Day2, Day3)

   
% This function compares isometric strength data over two days (Day1 and
% Day2 or Day2 and Day3). Output is a matrix with the first column listing
% subject IDs of participants who increased strength over the two days and
% the second column listing the value of the measured isometric strength
% increase. The first run will be to compare Day1 and Day2. The second run
% will be to compare Day2 and Day3.
[day1toDay2] = dayComparer(SubjectID, Day1, Day2)
[day2toDay3] = dayComparer(SubjectID, Day2, Day3)
   

% This function calculates weight-normalized isometric strength data for
% Day1, Day2, and Day3 output as normDay1mean, normDay2mean, and
% normDay3mean, respectively.
[normDay1mean, normDay2mean, normDay3mean] = wtNormData(Weight,Day1, Day2, Day3)


% This section creates a matrix of all of the function outputs that can then be exported. 

% Finds length of each output variable and creates column vector.
lengthEachVector = [ length(maleIsoIndMeans); length(femaleIsoIndMeans); length(maleGroupIsoMean); ...
    length(femaleGroupIsoMean); length(day1toDay2); length(day2toDay3); length(normDay1mean); ...
    length(normDay2mean); length(normDay3mean) ];

% Finds max length
maxOutputLength = max ( lengthEachVector, [], 'all' );    

% Preallocates matrix with length equal to longest output vector.
functionOutputs = zeros ( maxOutputLength, 13);

% Allocates each vector to the functionOutputs matrix
for i = 1 : length( maleIsoIndMeans)
    functionOutputs( i, 1) = maleIsoIndMeans( i, 1);
end

for i = 1 : length( maleIsoIndMeans)
    functionOutputs( i, 2) = maleIsoIndMeans( i, 2);
end

for i = 1 : length( femaleIsoIndMeans)
    functionOutputs( i, 3) = femaleIsoIndMeans( i, 1);
end

for i = 1 : length( femaleIsoIndMeans)
    functionOutputs( i, 4) = femaleIsoIndMeans( i, 2);
end

for i = 1 : length ( maleGroupIsoMean)
    functionOutputs( i, 5) = maleGroupIsoMean (i);
end

for i = 1 : length ( femaleGroupIsoMean)
    functionOutputs( i, 6) = femaleGroupIsoMean (i);
end

for i = 1 : length ( day1toDay2)
    functionOutputs( i, 7) = day1toDay2 (i, 1);
end

for i = 1 : length ( day1toDay2)
    functionOutputs( i, 8) = day1toDay2 (i, 2);
end

for i = 1 : length ( day2toDay3)
    functionOutputs( i, 9) = day2toDay3 (i, 1);
end

for i = 1 : length ( day2toDay3)
    functionOutputs( i, 10) = day2toDay3 (i, 2);
end

for i = 1 : length ( normDay1mean)
    functionOutputs( i, 11) = normDay1mean (i);
end
    
for i = 1 : length ( normDay2mean)
    functionOutputs( i, 12) = normDay2mean (i);
end
    
for i = 1 : length ( normDay3mean)
    functionOutputs( i, 13) = normDay3mean (i);
end


% ***NOTE***:
% Unfilled matrix cells (those without data) contain a zero. The zero is
% not data, but just represents an empty cell.
%
%Matrix column categories are:
%Column1 == maleIsoIndMeans subjectID
%Column2 == maleIsoIndMeans mean value
%Column3 == femaleIsoIndMeans subjectID
%Column4 == femaleIsoIndMeans mean value
%Column5 == maleGroupIsoMean value
%Column6 == femaleGroupIsoMean value
%Column7 == day1toDay2ID subjectID
%Column8 == day1toDay2ID strength diffrence value
%Column9 == day2toDay3ID subjectID
%Column10 == day2toDay3ID strength diffrence vale
%Column11 == normDay1mean value
%Column12 == normDay2mean value
%Column13 == normDay3mean value


% Exports functionOuputs maxtrix to a csv file.
writematrix(functionOutputs, 'iso_results.csv')

disp 'Export complete. Export file called "iso_results.csv". '