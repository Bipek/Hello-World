close all;
clear all;

nsteps=10;

x(1)=0
y(1)=0

for i=1:nsteps
    theta=2*pi*rand();
    r=1;
    dx=r*cos(theta); %stepsize
    dy=r*sin(theta);
    x(i+1)= x(1)+dx
    y(i+1)= y(1)+dy
end

plot(x,y,'r');
    

