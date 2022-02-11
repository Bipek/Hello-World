function KinematicsHW8
 
t1 = [0.0151 0.0908 .3177 .9834 1.9062 3.3132 4.8563 6.6263 9.1074 9.9697];
c1 = [0.9975 0.7146 0.5062 0.2581 0.1266 0.0546 0.0223 -0.0025 0 -0.0199];

t2 = [0.2572 1.3918 2.9652 4.2965 6.1876 7.78971];
c2 = [0.2134 0.1638 0.1241 0.0720 0.0149 -0.0447];

t3 = [0 0.3026 0.7413 1.1195 1.5582 2.1029 3.5098 5.2648 6.7474 8.6536 9.9092];
c3 = [1.0000 0.7022 0.4739 0.2779 0.1836 0.0546 -0.0099 -0.0596 -0.0447 -0.0521 -0.0496];

[h,p,ci,stats] = ttest2(c1,c2) %2 sample t-test using ull hypothesis that is pvalue above 5% means data is significant
[h,p,ci,stats] = ttest2(c1,c3)
[h,p,ci,stats] = ttest2(c2,c3)
mdl = fitlm(t1,c1) %gives R^2 value 
mdl = fitlm(t2,c2)
mdl = fitlm(t3,c3)


subplot(1,3,1)%plot of each data set with line of best fit
plot(t1,c1, 'or') %1st order reaction because 1/x
xlabel('Time')
ylabel('Concentration')
lsline


subplot(1,3,2)
plot(t2, c2, 'ob') %Oth order reaction because slope is straight line when plot is just time vs conc.  e^-x
xlabel('Time')
ylabel('Concentration')
lsline


subplot(1,3,3)
plot(t3, c3, 'og')  % 2nd order reaction 1/1+x plot at time vs concentrations
xlabel('Time')
ylabel('Concentration')
lsline

end