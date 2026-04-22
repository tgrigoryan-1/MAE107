% Code for Problem Set 3 Question 6 MAE 107 SP26
% The goal of this code is to find the root of a vector of functions using the NR method
% Utilizing an initial guess of x vector = (5 5)T

% Define f as an autonomous function
f = @(x) [ (x(1)^2+1)*(x(2)-1) ; (x(1)-2)*(x(2)+2) ];

% Define the jacobian of f as an autonomous function
J = @(x) [ 2*x(1)*x(2)-2*x(1) , x(1)^2+1 ; x(2)+2 , x(1)-2];

% Initialize guess to [5;5] 
xRoot = [5;5];

% Initialize counter to zero
nIter = 0;

% Define error/residual tolerance
tol = 1e-5;

% Start loop that goes while norm(f(xRoot)) is larger than tolerance
while norm(f(xRoot)) > 10^-5

    % Estimate the next root with Newton-Raphson (use the inv function)
    xRoot = xRoot - inv(J(xRoot))*f(xRoot);

    % Increment counter
    nIter = nIter + 1;

    % Print tracking metric
    fprintf('n = %d, x_r = (%1.2f,%1.2f), |f(x_r)| = %1.4e \n',...
        nIter,xRoot(1),xRoot(2),norm(f(xRoot)));

end