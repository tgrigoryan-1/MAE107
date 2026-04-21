% Problem uses NR method and Secant Method in order to find the root of f(x) = (exp^(-x))*(x^3 - 2) + 1
% For part 2, we are told to make a MATLAB function that takes the input of an initial guess xr0 and approximate error tolerance
% And it should output the numerically estimated root through Secant Method

function xRoot = secant(f,xRoot0,xRoot1,errTol)

% Function that perform secant method iteration to find x with f(x) = 0
%
% Inputs
% f - (function handle) f(x) in the problem definition as autonomous func
% xRoot0 - (float) initial root guess
% xRoot1 - (float) the other initial root guess
% errTol - (float) error tolerance on approximate error
% 
% Outputs
% xRoot - (float) estimated root the gives the right error

% Intialize variables
xRootim1 = xRoot0;
xRooti = xRoot0;
xRoot = xRoot1;

% Initialize error to infinity
errApprox = Inf;

% Initilize iteration counter
nIter = 0;

% While loop until the approximate error falls below the tolerance
while errApprox > errTol
    % Set the previous root as one iteration before
    xRootim1 = xRooti;
    xRooti = xRoot;

    % Use appropriate equation to calculate new root guess 
    xRoot = xRooti - ((f(xRooti)*(xRootim1 - xRooti))/(f(xRootim1) - f(xRooti)));

    % Iterate the count up by 1
    nIter = nIter + 1;

    % Calculate new approximate error
    errApprox = abs((xRoot - xRooti) / xRoot);

    % Print tracking metrics
    fprintf('Iteration n=%d, approx. error = %1.4e \n',nIter,errApprox);
    fprintf('\t Estimated root x_r = %1.4f \n',xRoot);

end

end