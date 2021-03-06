%compare different aspects


%% constant alpha=2.37, hollow, radius changing
close all

time=tactual(:,1);
times=(1:10000)/1000;


figure()
clf;
for k=1:30:90
    for j=1:length(tactual(:,1));
    avgpos(j)=mean(x_v(j,k:k+2));
    end
    plot(tactual(:,k),avgpos)
    hold all
end
%axis([0 3 0 80])

title('Velocity vs. Time for Shell Cylinder','interpreter','latex','fontsize',20)
xlabel('$t$ (sec)','interpreter','latex','fontsize',20)
ylabel('$v$ (in/sec)','interpreter','latex','fontsize',20)

legend('2 in Shell','3 in Shell','4 in Shell')

print -depsc ComR

%% constant alphs=2.37, hollow vs. solid


figure(2)
clf;
for z = 1:length(time)
    avgpos1(z)=mean(x_v(z,31:33));
    avgpos2(z)=mean(x_v(z,46:48));
end
plot(time,avgpos1,'k-')
hold on
plot(time,avgpos2,'b-')
axis([0 4 0 50])
title('Comparing Shell vs Solid 3 Inch Cylinder','interpreter','latex','fontsize',20)
xlabel('$t$ (sec)','interpreter','latex','fontsize',20)
ylabel('$v$ (in/sec))','interpreter','latex','fontsize',20)
legend('3 inch Shell' , '3 inch Solid','Location','NorthWest')
print -depsc CompHvS