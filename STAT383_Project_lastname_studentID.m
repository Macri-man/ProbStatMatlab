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

disp(['Code by: Alexander Macri  0384086 8:00 AM'])
disp(['Code by: Adam Kimball     0386149 8:00 AM'])
disp(['Code by: Grissess MacWookie  0000001 6:66 AM'])
disp([' ']);

%% Process data

dataA = load ( 'dataA.txt' );
%dataA = xlsread('STAT383_Project_data.xlsx',1,'B2:B21');
Na = size(dataA,1);

dataB = load ( 'dataB.txt' );
%dataB = xlsread('STAT383_Project_data.xlsx',1,'D2:D101');
Nb = size(dataB,1);

%% Plot the data (dataA)

% (Box plot) For the key parts of the plot, see figure 6.24 in textbook

figure('name','Boxplot for DataA');boxplot(dataA);title ('Boxplot for DataA');ylabel('ohms');

% (Histogram)
figure('name','Histogram for DataA');hist(dataA);title ('Histogram for DataA');ylabel('Frequency');xlabel('ohms')

%% Questions

% Is the data skewed? Why or why not. Use your plots to support your
% analysis. HINT: Read 6.2 and 6.3 carefully.

fprintf(['The Data Set, A, is [insert thing here] skewed \n ', ...
    'because [description]']);

disp([' '])
%% Plot the data (dataB)

% (Box plot) For the key parts of the plot, see figure 6.24
figure('name','Boxplot for DataB');boxplot(dataB);title ('Boxplot for DataA');ylabel('ohms')

% (Histogram)
figure('name','Histogram for DataB');hist(dataB);title ('Histogram for DataB');ylabel('Frequency');xlabel('ohms')


%% Questions

%Is the data skewed? Why or why not.. Use your plots to support your
%analysis. HINT: Read 6.2 and 6.3 carefully.

fprintf(['The Data Set, B, is [insert thing here] skewed \n ', ...
    'because [description]']);

disp([' '])
%% Sample Analysis
% For each data set, calculate the sample mean, mode, median and sample
% standard deviation. The median you can get from the box plot or the MatLab
% command "median(data)" and the mode seen from the data or use the MatLab
% command "mode(data)". However, the sample mean and sample standard
% deviation MUST be calculated using the formulas from the book, i.e.
% do not use software commands like "mean(X)" but you can still use "sum".



%% Confidence Intervals
% For this part, it will be useful to use the MatLab function "tinv". This
% will calculate the critical value for a random variable with a student-t
% distribution given v, which is the degrees of freedom.
%
% For example, to calculate the t-citical value given alpha = a, and v
% degrees of freedom (usually n-1), we would use,
%
%                   tinv(1-alpha,v)
%
%% Calculate and display TWO-sided "t" confidence intervals for the sample mean of dataA and dataB that you calculated above for...
%  (Display it in the same format as the instructions sheet.)

disp([' '])

meanA = sum(dataA)/Na;
meanB = sum(dataB)/Nb;
stdDevA = sqrt((sum(dataA - meanA)^2)/(Na-1));
stdDevB = sqrt((sum(dataB - meanB)^2)/(Nb-1));

% For confidence level 95% for dataA
disp(['The two-sided, 95% confidence interval for the sample mean of data set A, is (' num2str(meanA-(tinv(.95,Na-1)*(stdDevA/Na))) ', ' num2str(meanA+(tinv(.95,Na-1)*(stdDevA/Na))) ')']);

disp([' '])
% For confidence level 95% for dataB
disp(['The two-sided, 95% confidence interval for the sample mean of data set B, is (' num2str(meanA-(tinv(.95,Nb-1)*(stdDevB/Nb))) ', ' num2str(meanB+(tinv(.95,Nb-1)*(stdDevB/Nb))) ')']);

disp([' '])
% For confidence level 99% for dataA
disp(['The two-sided, 99% confidence interval for the sample mean of data set A, is (' num2str(meanA-(tinv(.99,Na-1)*(stdDevA/Na))) ', ' num2str(meanA+(tinv(.99,Na-1)*(stdDevA/Na))) ')']);

disp([' '])
% For confidence level 99% for dataB
disp(['The two-sided, 99% confidence interval for the sample mean of data set B, is (' num2str(meanB-(tinv(.95,Nb-1)*(stdDevB/Nb))) ', ' num2str(meanB+(tinv(.99,Nb-1)*(stdDevB/Nb))) ')']);

disp([' '])
%% Hypothesis Testing
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

%% Calculate and display (as a probability) the cumulative distribution function for...

% For t = 2.262 with 9 degrees of freedom.
disp(['The T cdf for t = 2.262 is P(T<t) = ' num2str(cdf('t',2.262,9))]);

%  Hint: To check your code, check that it matches the value in your t-table or Table III in the back of your textbook.

disp([' ']);
%% Calculate and display the p-value for ...

% For the two-sided problem for data A with null hypothesis H0: mu_A = 98.25
stdDevA = sqrt((sum(dataA - meanA)^2)/(Na-1));
tstarA = (((meanA - 98.25)*(sqrt(Na))/(stdDevA)));

disp(['For H0: mu_A = 98.25, the p-value = ' num2str(2*(1-cdf('t',0.05,Na-1)))]);

% For the two-sided problem for data B with null hypothesis H0: mu_B = 98.25
stdDevB = sqrt((sum(dataB - meanB)^2)/(Nb-1));
tstarB = (((meanB - 98.25)*sqrt(Nb))/(stdDevB));
disp(['For H0: mu_B = 98.25, the p-value = ' num2str(2*(1-cdf('t',0.05,Nb-1)))]);

disp([' ']);
%% QUESTION - Assume a significance level of 5%, should you reject the null hypothesis in either case now? Why?
% When you answer this below, include your calculated p-value in addtion to the t statistic.
% Do this for both dataA and dataB.
%
%  (Display your answer in the command window as before (same format as the
%  instructions sheet example). Hint: See figure 8.30 in book.

disp(['The absolute value of the t statistic for dataA ' num2str(tstarA)]);
disp(['The absolute value of the t statistic for dataB ' num2str(tstarB)]);


%% Paired, two sided t-test:
% Imagine that "dataA" is attained by meauring the resistors using a standard
% ohm meter. However, a new procudure measures the resistance in a much faster
% way. The data below (dataC) are the resitances as measured this new way.

% DO NOT ALTER THIS CELL

dataC = [103;99;107;101;96;99;101;95;97;101;99;98;101;101;105;103;103;104;98;91];

%% Calculate and display the p-value for ...

% For the two-sided problem with null hypothesis H0: muA - muC = 0

qAC = dataA-dataC;
dAC = sum(qAC)/Na;
sdAC = sum(qAC - dAC)^2/(Na-1);
tstarAC = ((dAC-0)*(sqrt(Na)))/(sdAC);

disp(['For H0: muA - muC = 0, the paired p-value = ' num2str(2*(1-cdf('t',0.05,Na-1)))])

%% QUESTION - Assume a significance level of 5%, would you say that there is a significant difference between the methods (reject)?
% 
%
%  (Display your answer in the command window as before (same format as the
%  instructions sheet example).

%% Un-paired (independent) two-sided t-test:
% Imagine that "dataA" is using the standard machine to make resistors,
% while a new machine that is cheaper is being used to to create the data
% below (dataD).

%% DO NOT ALTER THIS CELL

dataD = [103;99;107;101;96;99;101;95;97;101;99;98;101;101;105;103;103;104;98;91;95;97;101;99;98;101];

%% Calculate and display the p-value for (do NOT assume a pooled variance) ...

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

%% QUESTION - Assume a significance level of 5%, would you say that there is a significant difference between the machines (reject)?
% 
%
%  (Display your answer in the command window as before (same format as the
%  instructions sheet example).


disp([' '])
%%                  Fitting a Line (paramter estimation)
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

%% Calculate and display the slope and intercept
% using dataA as the independent varible (X) and dataY as the dependent variable (Y).
% You CANNOT use "polyfit" or the like. You must use the equations we
% discuss in class (12.2 in the book).


MM = (((Na * sum(dataA.*dataY)) - (sum(dataA) * sum(dataY)))/((Na*sum(dataA.^2)) - sum(dataA)^2));

BB = (sum(dataY)/Na);
%% Plot fitted regression line against data
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
