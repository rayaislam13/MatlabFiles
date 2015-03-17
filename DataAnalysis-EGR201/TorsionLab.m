%% torsion lab
load TORSIONTEST
torq=TORSIONTEST(:,1);
rad=TORSIONTEST(:,2);
%radius=c
c=.01917/2;  %%CHNAGE THIS
%L=guage length
L=1.835; %%CHANGE THIS
%sheerstrain
shrain=(c/L)*rad;
torq=(9.81/100)*torq;

%% plots

%T vs full strain

figure(1)
clf
hold on
plot(shrain, torq)
title('Torque vs. Sheer Strain')
xlabel('Sheer Strain (m)')
ylabel('Torque (N-m)')
hold off
%T vs reduced strain
%22 value shows approaches .012
figure(2)
clf
hold on
plot(shrain,torq)
title('Reduced Torque vs. Reduced Sheer Strain')
xlabel('Reduced Sheer Strain (m)')
ylabel('Reduced Torque (N-m)')
axis([0 .006 0 350])
hold off

%need to change axis
%line fitting shows that y=1.8083*10^9 x - 2.9514*10^6

%% analysis

%T/y ratio to get slope 30 position is where linear values end(.002)
newshrain=shrain(1:30);
newtorq=torq(1:30);
P=polyfit(newshrain,newtorq,1)
%P=ratio T/gamma=1.5402*10^5

x=linspace(0,.0021);
y=polyval(P,x);

%Yield Torque
figure(3)
clf
hold on
plot(shrain,torq)
%plot(shrainvals,torqmod)
plot(x+.002,y,'k--')
plot(x,y,'k.-')
title('Torque vs. Projected Strain')
xlabel('Shear Strain {\gamma} (radians) ')
ylabel('Torque (N-m) ')
%intersection =yield torque= (4.0615,YT->316.71)
Yieldtorq=316.71
%J = inertia
J=(pi/2)*(c^4)
% Shear's modulus P*c/J
shearmod=(P*c)/J
Yieldstress=Yieldtorq*c/J
Ulttorq=max(torq)
ultshear=((3*c)/(4*J))*Ulttorq

%raw data 
figure(4)
clf
hold on
plot(shrain*(180/pi),torq)
title('Raw Data of Torque vs. Degrees')
xlabel('Degrees')
ylabel('Torq (N-m)')