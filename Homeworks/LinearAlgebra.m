clear;
syms x

%% Ask for user input
N=input('How many functions will be entered?\n');
A=0;
A=sym(A);
for k=1:N
    if k==1
        t=input('First function:');
        A(1,k)=t;
    elseif k==N
        t=input('Last function:');
        A(1,k)=t;
    else t=input('Next function:');
        A(1,k)=t;
    end
end

%% Setting up the wronskian matrix
for k=1:(N-1)
    A=[A; diff(A(k,:))];
end

%% Calculate the determinant and analyze
w=det(A);
w=simple(w);
if w~=0
    fprintf('These functions are linearly independent on R\n')
elseif w==0
    fprintf('Wronskian is equal to zero\n')
end