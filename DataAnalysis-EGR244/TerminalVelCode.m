%Raya Islam (rqi)

%% statistical analysis on terminal velocities

%constants
D=0.019939; %meters
W=0.001143; %meters
L=.762; %meters
mM=1;
sig=6e7;
p=7.4e3;
g=9.81;
%convert inches to meters: meters=inches/39.37

%create anonymous function for terminal velocity
%converts diameter in inches to meters
termvel= @(d) (128/(15*pi)) * ((p*g)/(sig)) * (D/W) .* ((D./(d./39.37)).^3)
dvec=linspace(.25,.75,100);

figure(1)
clf;
 for k=dvec;
     yvals=termvel(k);
     plot(k,yvals,'.')
     
     hold on
 end
axis([.24 .76 0 .8])
title('Calculated Velocity vs. Experimental Velocity')
xlabel('Diameter (inches)') 
ylabel('Terminal Velocity (m/s)')



%experimental vals
dia=[1/4 5/16 3/8 7/16 .5 5/8 .75];
exptvel=[.2522 .2956 .2702 .2628 .2402 .1176 .0773];
plot(dia,exptvel,'ro')