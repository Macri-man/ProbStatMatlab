%%
% Student Names: Your FULL NAME(s)
% Student IDs: Your STUDENT ID(s)
%
%                      Probability and Statistics
%
%                       Instructor: Ying He
%                         
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Resistors
%
% Assume that we tested two batches of resistors (ohms) from two different
% plants, A and B. The first batch was very small. The second batch
% was much larger.

%% Init

clc

clear

close all

format compact

disp('Code by: Alexander Macri  0384086 8:00 AM')
disp('Code by: Adam Kimball     0386149 8:00 AM')
disp('Code by: Grissess MacWookie  0000001 6:66 AM')
disp(' ');

%% Process data [Done]

dataA = load ( 'dataA.txt' );
%dataA = xlsread('STAT383_Project_data.xlsx',1,'B2:B21');
Na = size(dataA,1);

dataB = load ( 'dataB.txt' );
%dataB = xlsread('STAT383_Project_data.xlsx',1,'D2:D101');
Nb = size(dataB,1);

%% Plot the data (dataA) [Done]

% (Box plot) For the key parts of the plot, see figure 6.24 in textbook

figure('name','Boxplot for DataA');boxplot(dataA);title ('Boxplot for DataA');ylabel('ohms');

% (Histogram)
figure('name','Histogram for DataA');hist(dataA);title ('Histogram for DataA');ylabel('Frequency');xlabel('ohms')

%% Questions [Done]

% Is the data skewed? Why or why not. Use your plots to support your
% analysis. HINT: Read 6.2 and 6.3 carefully.

disp(['The data in the first data set, A, seems to be Bimodal. \n' ... 
    'This is illustrated by the fact that the box plot indicates a very symmetric relationship to either side of the median line\n' ... 
    '(from min to q1 and q3 to max, as well as q1 to median and median to q3),\n' ...
    'in addition to the histogram, visually, having two apparent distinct distribution curves, which is indicative of bimodality.']);

disp('\n\n');
%% Plot the data (dataB)[Done]

% (Box plot) For the key parts of the plot, see figure 6.24
figure('name','Boxplot for DataB');boxplot(dataB);title ('Boxplot for DataB');ylabel('ohms')

% (Histogram)
figure('name','Histogram for DataB');hist(dataB);title ('Histogram for DataB');ylabel('Frequency');xlabel('ohms')


%% Questions [Done]

%Is the data skewed? Why or why not.. Use your plots to support your
%analysis. HINT: Read 6.2 and 6.3 carefully.

disp(['The data in the second data set, B, seems to be positively skewed. \n' ... 
    'This is illustrated by the fact that in the boxplot, the length of the horizontal line from the median to Q3 is much longer than from Q1 to the median.\n' ...
    'This is also illustrated by the histogram, visually, having a long tail to the right, which is indicative of a positive skew.']);

disp('\n\n');

%% Sample Analysis [NOT DONE]
% For each data set, calculate the sample mean, mode, median and sample
% standard deviation. The median you can get from the box plot or the MatLab
% command "median(data)" and the mode seen from the data or use the MatLab
% command "mode(data)". However, the sample mean and sample standard
% deviation MUST be calculated using the formulas from the book, i.e.
% do not use software commands like "mean(X)" but you can still use "sum".

meanA = sum(dataA)/Na;
meanB = sum(dataB)/Nb;

diffA = dataA - meanA;
diffB = dataB - meanB;

varA = (sum(diffA.^2))/(Na-1);
varB = (sum(diffB.^2))/(Nb-1);

stdDevA = sqrt((sum(diffA.^2))/(Na-1));
stdDevB = sqrt((sum(diffB.^2))/(Nb-1));

sampleStdDevA = sqrt((sum(diffA.^2))/(Na));
sampleStdDevB = sqrt((sum(diffB.^2))/(Nb));

disp('For data set A:');
disp(['The sample mean is ' num2str(meanA)]);
disp(['The mode is ' num2str(mode(dataA))]);
disp(['The median is ' num2str(median(dataA))]);
disp(['The sample standard deviation is ' num2str(sampleStdDevA)]);
disp(' ');
disp('For data set B:');
disp(['The sample mean is ' num2str(meanB)]);
disp(['The mode is ' num2str(mode(dataB))]);
disp(['The median is ' num2str(median(dataB))]);
disp(['The sample standard deviation is ' num2str(sampleStdDevB)]);


%% Confidence Intervals [NOT DONE]
% For this part, it will be useful to use the MatLab function "tinv". This
% will calculate the critical value for a random variable with a student-t
% distribution given v, which is the degrees of freedom.
%
% For example, to calculate the t-citical value given alpha = a, and v
% degrees of freedom (usually n-1), we would use,
%
%                   tinv(1-alpha,v)
%
%% Calculate and display TWO-sided "t" confidence intervals for the sample mean of dataA and dataB that you calculated above for... [NOT DONE]
%  (Display it in the same format as the instructions sheet.)

disp(' ')

% For confidence level 95% for dataA

t95A = tinv(.95,Na-1);
lower95A = meanA-(t95A*(sampleStdDevA/Na));

upper95A = meanA+(t95A*(sampleStdDevA/Na));

disp(['The two-sided, 95% confidence interval for the sample mean of data set A, is (' num2str(lower95A) ', ' num2str(upper95A) ')']);

disp(' ')
% For confidence level 95% for dataB

t95B = tinv(.95,Nb-1);
lower95B = meanB-(t95B*(sampleStdDevB/Nb));

upper95B = meanB+(t95B*(sampleStdDevB/Nb));

disp(['The two-sided, 95% confidence interval for the sample mean of data set B, is (' num2str(lower95B) ', ' num2str(upper95B) ')']);

disp(' ')
% For confidence level 99% for dataA

t99A = tinv(.99,Na-1);
lower99A = meanA-(t99A*(sampleStdDevA/Na));

upper99A = meanA+(t99A*(sampleStdDevA/Na));

disp(['The two-sided, 99% confidence interval for the sample mean of data set A, is (' num2str(lower99A) ', ' num2str(upper99A) ')']);

disp(' ')
% For confidence level 99% for dataB

t99B = tinv(.99,Nb-1);
lower99B = meanB-(t95B*(sampleStdDevB/Nb));

upper99B = meanB+(t99B*(sampleStdDevB/Nb));

disp(['The two-sided, 99% confidence interval for the sample mean of data set B, is (' num2str(lower99B) ', ' num2str(upper99B) ')']);

disp(' ')
%% Hypothesis Testing [NOT DONE]
%
% For this part, it will be useful to use the MatLab function "cdf". This
% function will calculate the cumulative distribution function for a
% particular distribution. For example, to calculate P(X < x) where X is a
% normally distributed variable with some known mean and STANDARD DEVIATION
% (MatLab uses std dev in its code, not variance) we would use,
%
%                   cdf('normal',x,mean, std dev)
%
% where mean and variance are numerical values and 'normal" is put in
% exactly as shown. For example, the standard normal distribution has a
% specific mean and variance, namely mean = 0 and var = 1. Therefore,
% if we want to calculate P(Z < z), we use the cumulative distribution for
% a standard normal distribution which would be,
%
%                   cdf('normal',z,0,1)
%
% Similarly, you can calculate the cumulative distribution function for a
% student-t or just "t" distribution for some amount v, or degrees of
% freedom,
%
%                   cdf('t',t,v)
%
% NOTE: Both cdf functions calculate P(X < x). In other words, the function
% is defined from -inf to x. Typically you need P(X > x) for the p-value.

%% Calculate and display (as a probability) the cumulative distribution function for... [NOT DONE]

% For t = 2.262 with 9 degrees of freedom.
disp(['The T cdf for t = 2.262 is P(T<t) = ' num2str(cdf('t',2.262,9))]);

%  Hint: To check your code, check that it matches the value in your t-table or Table III in the back of your textbook.

disp(' ');
%% Calculate and display the p-value for ... [NOT DONE]

% For the two-sided problem for data A with null hypothesis H0: mu_A = 98.25
tstarA = (((meanA - 98.25)*(sqrt(Na))/(sampleStdDevA)));

disp(['For H0: mu_A = 98.25, the p-value = ' num2str(2*(1-cdf('normal',98.25,meanA,sampleStdDevA)))]);

% For the two-sided problem for data B with null hypothesis H0: mu_B = 98.25
tstarB = (((meanB - 98.25)*sqrt(Nb))/(sampleStdDevB));

disp(['For H0: mu_B = 98.25, the p-value = ' num2str(2*(1-cdf('normal',98.25,meanB,sampleStdDevB)))]);

disp(' ');
%% QUESTION - Assume a significance level of 5%, should you reject the null hypothesis in either case now? Why? [NOT DONE]
% When you answer this below, include your calculated p-value in addtion to the t statistic.
% Do this for both dataA and dataB.
%
%  (Display your answer in the command window as before (same format as the
%  instructions sheet example). Hint: See figure 8.30 in book.

disp(['The absolute value of the t statistic for dataA ' num2str(tstarA)]);
disp(['[is whatever than] the critical value, ' num2str(cdf('t',0.05,Na-1)) ]);
disp('and therefore with a significance level of 5%, we [do something] the null.');


disp(['The absolute value of the t statistic for dataB ' num2str(tstarB)]);
disp(['[is whatever than] the critical value, ' num2str(cdf('t',0.05,Nb-1)) ]);
disp('and therefore with a significance level of 5%, we [do something] the null.');




%% Paired, two sided t-test: [NOT DONE]
% Imagine that "dataA" is attained by meauring the resistors using a standard
% ohm meter. However, a new procudure measures the resistance in a much faster
% way. The data below (dataC) are the resitances as measured this new way.

% DO NOT ALTER THIS CELL

dataC = [103;99;107;101;96;99;101;95;97;101;99;98;101;101;105;103;103;104;98;91];

%% Calculate and display the p-value for ... [NOT DONE]

% For the two-sided problem with null hypothesis H0: muA - muC = 0

qAC = dataA-dataC;
dAC = sum(qAC)/Na;
sdAC = sum(qAC - dAC)^2/(Na-1);
tstarAC = ((dAC-0)*(sqrt(Na)))/(sdAC);

disp(['For H0: muA - muC = 0, the paired p-value = ' num2str(2*(1-cdf('t',0.05,Na-1)))])

%% QUESTION - Assume a significance level of 5%, would you say that there is a significant difference between the methods (reject)? [NOT DONE]
% 
%
%  (Display your answer in the command window as before (same format as the
%  instructions sheet example).

disp(['The absolute value of the t statistic ' num2str(tstarAC)]);
disp(['[is whatever than] the critical value, ' num2str(cdf('t',0.05,Nb-1)) ]);
disp('and therefore with a significance level of 5%, we [do something] the null.');


%% Un-paired (independent) two-sided t-test: [NOT DONE]
% Imagine that "dataA" is using the standard machine to make resistors,
% while a new machine that is cheaper is being used to to create the data
% below (dataD).

%% DO NOT ALTER THIS CELL

dataD = [103;99;107;101;96;99;101;95;97;101;99;98;101;101;105;103;103;104;98;91;95;97;101;99;98;101];

%% Calculate and display the p-value for (do NOT assume a pooled variance) ... [NOT DONE]

% For the two-sided problem with null hypothesis H0: muA - muD = 0

Nd = size(dataD,1);

meanA = sum(dataA)/Na;
meanD = (sum(dataD)/Nd);

VarA = sum(dataA - meanA)^2/(Na-1);
VarD = sum(dataD - meanD)^2/(Nd-1);

numor = meanA-meanD-0;
denom = sqrt((VarA/Na)+(VarD/Nd));

tstarAD = numor/denom;

disp(['For H0: muA - muC = 0, the paired p-value = ' num2str(2*(1-cdf('t',0.05,Nd-1)))])

%% QUESTION - Assume a significance level of 5%, would you say that there is a significant difference between the machines (reject)? [NOT DONE]
% 
%
%  (Display your answer in the command window as before (same format as the
%  instructions sheet example).

disp(['The absolute value of the t statistic ' num2str(tstarAD)]);
disp(['[is whatever than] the critical value, ' num2str(cdf('t',0.05,Nb-1)) ]);
disp('and therefore with a significance level of 5%, we [do something] the null.');

disp(' ')
%%                  Fitting a Line (paramter estimation) [NOT DONE]
%
% The manager of the resistor plant wishes to investigate how the plant's
% electricity usage depends upon the value of the resistor produced.
% DataA is the resistor information while the data below is the electricity
% is used during the production of the resistors.
%
% The manager plots the data and determines that a linear model is best.
%
%                           Y = m * X + b;
%
% where Y is electricty usage (in watts) and X is value of the resistors.

%% DO NOT ALTER THIS CELL
m = 0.5;    % slope of relationship
b = 0.2;    % intercept

G = 0.1; %Noise factor

s = G*randn(1,Na);      % uncertainty in time measurements (standard deviation)

Y = m*dataA' + b + s;
dataY = Y';

%% Calculate and display the slope and intercept [NOT DONE]
% using dataA as the independent varible (X) and dataY as the dependent variable (Y).
% You CANNOT use "polyfit" or the like. You must use the equations we
% discuss in class (12.2 in the book).


MM = (((Na * sum(dataA.*dataY)) - (sum(dataA) * sum(dataY)))/((Na*sum(dataA.^2)) - sum(dataA)^2));

BB = (sum(dataY)/Na);
%% Plot fitted regression line against data [NOT DONE]
% The following code is how I display line and data. It doesn't mean you
% HAVE to use it.....
%
% Fit2=MM*dataA + BB;    
% This is my fit line. MM and BB are estimates for slope and intercpet.
%
% figure;plot(dataA,dataY,'b.',dataA,Fit2,'r-');
% xlabel('Resistance(ohms)');
% ylabel('Electricity Usage(Watts)');
% title('Best Linear Fit')
% 

Fit2=MM*dataA + BB;    
%This is my fit line. MM and BB are estimates for slope and intercpet.

figure('name','This is my fit line. MM and BB are estimates for slope and intercpet');plot(dataA,dataY,'b.',dataA,Fit2,'r-');
xlabel('Resistance(ohms)');
ylabel('Electricity Usage(Watts)');
title('Best Linear Fit')
