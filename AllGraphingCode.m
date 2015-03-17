%% This code for a lab in an Engineering Dynamics course collected data of 
%cylinders of varying diameters rolling down a changing inclines. 
%It takes in tens of thousands of data points collected by a sensor and 
%creates plots for the average position vs. time and velocity vs. time with
%error bars


%% representative plots for 3 in hollow and 3 in solid

load newdata.mat;
close all
time=tactual(:,1);

times=(1:10000)/1000;
%times=timex/1000;
%% position
%plots the average position line for one cylinder, all bank angles
%new cylinder every 15 columns
%3 inch hollow



figure()
clf;
for k=31:3:45
    for j=1:length(tactual(:,1))
    avgpos(j)=mean(x_s(j,k:k+2));
    end
    plot(tactual(:,k),avgpos)
    hold all
end
axis([0 3 0 80])

%error bars
time2 = zeros(25,5);
m=zeros(25,5);
s=zeros(25,5);
n=400;
timex=(1:10000)/1000;
timet=1:10000;

for p=31:3:45
    k=(p-31)/3+1
    for i=1:25
        time2(i,k)=tactual(2+n*(i-1),p)
        m(i,k)=mean(x_s(2+n*(i-1),p:p+2))
        s(i,k)=std(x_s(2+n*(i-1),p:p+2));
    end
    errorbar(time2(:,k),m(:,k),s(:,k),'.')
end




legend('2.37 deg','3.94 deg','5.55 deg','7.13 deg','8.86 deg','Location','NorthWest')
title('Position vs. Time (3 in shell)','interpreter','latex','fontsize',20)
xlabel('$t$ (sec)','interpreter','latex','fontsize',20)
ylabel('$x$ (in)','interpreter','latex','fontsize',20)
hold off

print -depsc PT3H

%3 inch solid
figure()
clf;
for h=46:3:60
    for j=1:length(tactual(:,1))
    avgpos(j)=mean(x_s(j,h:h+2));
    end
    plot(tactual(:,h),avgpos)
    hold all
end
axis([0 3 0 80])

legend('2.37 deg','3.94 deg','5.55 deg','7.13 deg','8.86 deg','Location','NorthWest')
title('Position vs. Time (3 in solid)','interpreter','latex','fontsize',20)
xlabel('$t$ (sec)','interpreter','latex','fontsize',20)
ylabel('$x$ (in)','interpreter','latex','fontsize',20)




for z=46:3:60
    k=(z-46)/3+1
    for i=1:25
        time2(i,k)=tactual(2+n*(i-1),z)
        m(i,k)=mean(x_s(2+n*(i-1),z:z+2))
        s(i,k)=std(x_s(2+n*(i-1),z:z+2));
    end
    errorbar(time2(:,k),m(:,k),s(:,k),'.')
    
end
hold off
print -depsc PT3S



%% velocity vs time

figure()
clf;
for k=31:3:45
    for j=1:length(tactual(:,1))
    avgpos(j)=mean(x_v(j,k:k+2));
    end
    plot(tactual(:,k),avgpos)
    hold all
end
axis([0 3 0 80])
legend('2.37 deg','3.94 deg','5.55 deg','7.13 deg','8.86 deg','Location','NorthWest')
title('Velocity vs. Time (3 in shell)','interpreter','latex','fontsize',20)
xlabel('$t$ (sec)','interpreter','latex','fontsize',20)
ylabel('$v$ (in/sec)','interpreter','latex','fontsize',20)


for p=31:3:45
    k=(p-31)/3+1
    for i=1:25
        time2(i,k)=tactual(2+n*(i-1),p)
        m(i,k)=mean(x_v(2+n*(i-1),p:p+2))
        s(i,k)=std(x_v(2+n*(i-1),p:p+2));
    end
    errorbar(time2(:,k),m(:,k),s(:,k),'.')
end
hold off

print -depsc VT3H

%3 inch solid
figure()
clf;
for h=46:3:60
    for j=1:length(tactual(:,1))
    avgpos(j)=mean(x_v(j,h:h+2));
    end
    plot(tactual(:,h),avgpos)
    hold all
end


for q=46:3:60
    k=(q-46)/3+1
    for i=1:25
        time2(i,k)=tactual(2+n*(i-1),q)
        m(i,k)=mean(x_v(2+n*(i-1),q:q+2))
        s(i,k)=std(x_v(2+n*(i-1),q:q+2));
    end
    errorbar(time2(:,k),m(:,k),s(:,k),'.')
end
axis([0 3 0 80])
hold off
legend('2.37 deg','3.94 deg','5.55 deg','7.13 deg','8.86 deg','Location','NorthWest')
title('Velocity vs. Time (3 in solid)','interpreter','latex','fontsize',20)
xlabel('$t$ (sec)','interpreter','latex','fontsize',20)
ylabel('$v$ (in/sec)','interpreter','latex','fontsize',20)

print -depsc VT3S