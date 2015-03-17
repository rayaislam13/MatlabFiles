%% plot

x=[0:1.2:10.8];
y=[0:1.2:10.8];
z=[4.26	3.96 3.34 2.42 0 0 2.47	3.26 3.64 3.84;
4.67 4.38 3.74 2.96 0 0 2.98 3.76 4.17 4.28;
5.36 5.21 4.69 3.94 3.2 3.27 4.11 4.6 4.86 5.01;
6.2	6.13 6 5.92 5.74 5.67 5.83 6.109 6.06 6;
6.96 7.3 7.62 7.7 7.38 7.48 7.73 7.52 7.23 7.11;
7.76 8.15 8.95 9.28 8.66 8.78 9.48 8.57 8.05 7.91;
8.15 8.85 9.26 9.43 9.18 9.24 9.48 9.08 8.71 8.48;
9.09 9.17 9.37 9.47 9.37 9.4 9.48 9.28 9.07 8.93;
9.23 9.3 9.42 9.48 9.45 9.46 9.49 9.37 9.23 9.15;
9.31 9.36 9.44 9.47 0 0 9.49 9.39 9.31 9.25];

figure 
mesh(x,y,z)
xlabel('x position')
ylabel('y position')
zlabel('Voltage')
title('Position of Voltage Readings')


%% quiver


for i=1:1:9
    for j=1:1:9
        Ex(i,j)=(z(i+1,j)-z(i,j))/(x(i+1)-y(i));
    end
end


for i=1:1:9
    for j=1:1:9
        Ey(i,j)=(z(i,j+1)-z(i,j))/(y(j+1)-y(j));
    end
end

figure 
[ii,jj] = gradient(z)
quiver(ii,jj)
xlabel('i position')
ylabel('j position')
title('Electric Field Vector Position')