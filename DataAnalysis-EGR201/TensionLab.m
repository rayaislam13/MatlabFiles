%% load data

load tensiondata.txt;

%% convert columns
Force=tensiondata(:,1); %can redefine later by taking off few points (force=force(11:100)
Strain=tensiondata(:,3);

%% Plotting
figure(1)
hold on
plot(Force,Strain)
xlabel('Force')
ylabel('Strain')
title('Data Points')
hold off

%stress=force/area 
Area=((6.36/2000)^2)*pi;
ilength=50.7619/1000;
flength=65.02/1000;
stress=Force/Area;
Strain=Strain/100;
hold on
figure(2)
plot(Strain,stress)
title('Stress vs. Strain')
xlabel('Engineering Strain (mm/mm)')
ylabel('Engineering Stress (Pascals)')

%change range to just show linear portion
hold on
figure(3)

plot(Strain,stress)
axis ([0 .003 0 7*10^8])
title('Reduced Range Stress vs. Strain')
xlabel('Engineering Strain (mm/mm)')
ylabel('Engineering Stress (Pascals)')

%% Analysis
%young's modulus = slope of straight line answer=1.9394*10^11
%in data position 73 is where the data starts reaching .003 strain
%this is about where the strain ends
newStrain=Strain(1:73)
newStress=stress(1:73)
P=polyfit(newStrain,newStress,1)

%yield stress start at x=.002 and draw straight line with slope Youngs mod
%find intersection of that line and stress strain curve
x=linspace(0,.011);
y=polyval(P,x);

figure(4)
hold on
plot(x+.002,y)
plot(Strain,stress)
axis([0 .01 0 .7*10^9])
xlabel('Strain(mm/mm)')
ylabel('Stress(Pascals)')
title('Yield Stress Projection')
hold off
%intersection:(.005064,5.965*10^8)
%ultimate stress answer=6.4141*10^8
US=max(stress)