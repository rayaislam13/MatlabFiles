%% This lab assignment for a mechatronics course calculates the 
%power absorbed by a given circuit

%define t variable
t=linspace(0,3,50);

%equations
v=10*cos(2*t);
i=20*(1-exp(-.5*t));
pwr=v.*i;

%plot
figure
plot(t,pwr)
title('Power Absorbed by Device (rqi)')
xlabel('Time (s)')
ylabel('Power (mW)')