%% This lab compares the values at which different sized metal rods buckle
%It compares theoretical with experimental values

%% equation for graph

%in equation, L is independent var and load (P) is dependent

%define all possible values in L in experiment

L=linspace(1.5,6);
k=1;  %bc pinned-pinned factor k=1
I=(1/12)*(.5)*(.125^3); %orientation of cross section
E=10000000; %psi
A=.5*.125; % area
r=sqrt(I/A);
CY=42000*A; %compressive yielding = 2625

f=[222.6629,498.9956,2008,3458];
Lcalc=[1.524,2,4.021,6.006];


%graphing

x=(k*L)/r ;  



P=((pi^2)*E*A)./(x.^2) ;  %critical load equation

hold on

figure(1)
clf
plot(x,P) %theoretical column strenth w/ nom vals
hold on   %predicted vals with calc vals
plot(166.4432,222.6629,'+',111.1838,498.9956,'+',55.4256,2008,'+',42.2343,3458,'+','MarkerSize',10)
hold on   %tested vals
plot(166.4432,279.512,'o',111.1838,643.702,'o',55.4256,1959.583,'o',42.2343,2862.191,'o','MarkerSize',10)
%plot(x,f,'k-')
hold on  %compressive yielding line nom
plot(x,CY,'b-','MarkerSize',15)
hold on %calculated com yielding
plot(166.4432,(42000*.554*.124),'*',111.1838,(42000*.553*.126),'*',55.4256,(42000*.548*.122),'*',...
    42.2343,(42000*.561*.123),'*','MarkerSize',10)
%legend('Buckling (nominal vals)','More Stuff','even more stuff')
%legend('boxon')
title('Load (P) vs. Slenderness Ratio (kL/r)')
xlabel('Slenderness Ratio (kL/r) inches')
ylabel('Load (P) pounds')
%plot(10,2,'b+','MarkerSize',10)
%axis[]
hold off
