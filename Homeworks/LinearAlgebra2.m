%% 2.3 # 32 if determinant is nonzero, vectors are linearly independent

A=[1 -1 0 0 0 3 1; 0 1 1 0 1 1 1; -1 0 1 1 3 1 1;...
    2 0 -1 -2 -5 0 -1; 3 1 2 1 -1 -1 -1; 1 3 2 -3 2 -2 -1; 2 -1 0 2 1 -3 1]
B = det(A)   %det=-251 therefore is linearly independent

Span=orth(A) %proves that A spans

%32 pt b find coordinate

AN=[7 6 -5 -4 -3 2 1]

%% 2.4 #26
AA1=[-2 3 -1 4 -2]
AA2=[3 -1 2 6 8]
AA3=[1 7 -5 1 4]
AA4=[0 12 -5 15 8]