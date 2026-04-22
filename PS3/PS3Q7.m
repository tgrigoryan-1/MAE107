% Code for Problem Set 3 Question 7 MAE 107 SP26
% The goal of this code is to find the root of a vector of functions using the NR method
% Utilizing an initial guess of x vector = (1; 0.8; 0.9)

% Define constants
a = 0.5;
b = 0.5;

% Define f as an autonomous function
f = @(x) [ x(1)*(x(1) + a*x(2) + b*x(3) - 1) ; x(2)*(b*x(1) + x(2) + a*x(3) -1) ; x(3)*(a*x(1) + b*x(2) + x(3) - 1)];

% Define the jacobian of f as an autonomous function
J = @(x) [ 2*x(1) + a*x(2) + b*x(3) - 1 , a*x(1) , b*x(1); b*x(2) , b*x(1) + 2*x(2) + a*x(3) - 1 , a*x(2) ; a*x(3) , b*x(3), a*x(1) + b*x(2) + 2*x(3) - 1];

% Initialize guess to [5;5]
xRootOld = [1;0.8;0.9];
xRoot = [1;0.8;0.9];

% Initialize counter to zero
nIter = 0;

% Define error/residual tolerance
errApprox = Inf;

% Start loop that goes while norm(f(xRoot)) is larger than tolerance
while errApprox > 0.0001
    xRootOld = xRoot;
    % Estimate the next root with Newton-Raphson (use the inv function)
    xRoot = xRoot - inv(J(xRoot))*f(xRoot);

    % Increment counter
    nIter = nIter + 1;

    % Print tracking metric
    fprintf('n = %d, x_r = (%1.2f,%1.2f,%1.2f), |f(x_r)| = %1.4e \n',...
        nIter,xRoot(1),xRoot(2), xRoot(3),norm(f(xRoot)));
    errApprox = norm((xRoot - xRootOld))/norm(xRoot)

end