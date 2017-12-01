% System Matrices
A = [2, 0;1, -1];
B = [1 ; 1];
%Lets pick our favourite poles
P = [-0.5+1i ; -0.5-1i];
%P = [-1+1i ; -1-1i];
%P = [-5 ; -1];
% Pole Placement
K = place(A,B,P);
% Compute the solution
x = [1;1]; t = 0; tf = 5; dt = 0.01;
X = []; T = [];
while(t < tf)
    X = [X, x]; T = [T;t];
    x = x+dt.*(A-B*K)*x;
    t = t+dt;
end
hold on;
plot(T,X(1,:));