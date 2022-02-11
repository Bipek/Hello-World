function AbsIsotMain

close all;

pCO2=[25 50 100 200 400 760];
yAbs=[6.69e-2 9.24e-2 0.108 0.114 0.127 0.137];
% yAbs = a * pCO2^n
% ln(yAbs) = ln(a) + n * ln(pCO2)
lnpCO2 = log(pCO2);
lnyAbs = log(yAbs);

[lin, linS] = polyfit(lnpCO2, lnyAbs, 1)
% lin(1) = slope; lin(2) = constant
% y = lin(2) + lin(1) * x
a = exp(lin(2)) 
n = lin(1)

x=linspace(0,800,20);
ylin=a*x.^n;

plot(pCO2, yAbs, 'o', x, ylin, '-r');
xlabel('absorbed'); ylabel('P_CO2');
grid on;

end