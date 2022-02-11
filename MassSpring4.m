k = 1;  %setting up and definig variables
m = 1;
dt = 0.1; %the dt is too low so if you multiply it the dt then MassSpring4 will speed up
numiterations = 142;
y = 0.75;
v = 0;
damping = 0;
t = 0;
theticks = pi.*[1:4];

figure(gcf) % figure creates figure graphic objects in this case gcf, gcf is used to return the current figure handle and current figure is the window where graphics commands draw their results
clf %clf deletes from the current figure all graphics objects whose handles are not hidden


for nn = 1:numiterations
    subplot(2,2,1); %sublpt that allows for 4 plots to be shown simultaneously
    plot(0,y,'bs','MarkerSize',12,'MarkerFaceColor','b');
    axis([-1 1 -1 1]);
    title('mass-spring');
    set(gca, 'YGrid', 'on', 'XGrid', 'off')
    set(gca,'XTickLabel','')
    
    % fill me in to make a plot of height vs. time in upper-right subplot
    
    subplot(2,2,2); %plot for the uper right corner
    plot(t,y,'or','MarkerSize',2);  %creates a height vs time plot
    axis([-0.1 numiterations*dt -1 1]); %limits the x and y axis that can be viewed
    title('height'); %title plot
    hold on; %hold on retains the current plot and certain axes properties so that subsequent graphing commands add to the existing graph.
    grid on; %display grid on plot
    set(gca,'XTick',theticks);  %sets the axis tick placement for the current figure. gca gets the axis of the current figure 
    set(gca,'xticklabel',round(theticks*10)/10) %sets the axis tick placement for the current figure. gca gets the axis of the current figure
    
    subplot(2,2,4); %another plot in the window
    plot(t,v,'or','MarkerSize',2); %plots time vs velocity
    axis([-0.1 numiterations*dt -1 1]); %limits the axes
    title('speed'); %title the plot
    hold on;
    grid on;
    set(gca,'XTick',theticks); %sets the axis tick placement for the current figure. gca gets the axis of the current figure
    set(gca,'xticklabel',round(theticks*10)/10) %sets the axis tick placement for the current figure. gca gets the axis of the current figure
    
    subplot(2,2,3); %plots another plot in the window
    plot(t,m*v^2/2,'or','MarkerSize',2); axis([-0.1 numiterations*dt 0 0.5]); %plots kinetic energy
    hold on;
    if nn ==1 %if statement to plot energy 
        title('energy');
        axis([-0.1 numiterations*dt 0 0.5]);
        grid on;
        set(gca,'XTick',theticks);
        set(gca,'xticklabel',round(theticks*10)/10)
    end %ends if statement
    plot(t,k*y^2/2,'ob','MarkerSize',2); %plots potential energy
    
    plot(t,k*y^2/2 + m*v^2/2,'+k','MarkerSize',2); axis([-0.1 numiterations*dt 0 0.5]); %plots total energy
    
    drawnow %same as other MassSpring commetns
    
    y = y + v.*dt; %setting up equations to define new y, f, a, v, t as loop goes through new iterations
    f = -k*y;
    a = f/m;
    v = (v + a.*dt)*(1-damping);
    t = t + dt;
end % nn %ends for loop
subplot(2,2,3)
        t1=legend('KE','PE','Total'); %creates a legend for the sublot(2,2,3) which helps identify KE, PE, Totla
        set(t1,'FontSize',9);%,'DataAspectRatio',[0.5 1 1]) %sets font of the legends

