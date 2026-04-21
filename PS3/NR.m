% Code for Problem Set 2 Question 3 MAE 107 SP26
% Problem uses NR method and Secant Method in order to find the root of f(x) = (exp^(-x))*(x^3 - 2) + 1
% For part 1, we are told to make a MATLAB function that takes the input of an initial guess xr0 and approximate error tolerance
% And it should output the numerically estimated root through Newton Raphson Method

function xRoots = NR(f, df, xRootGuess,errTol)
% Function that perform newton-raphson iteration to find x with f(x) = 0
%
% Inputs
% f - (function handle) f(x) in the problem definition as autonomous func
% df - (function handle) x-derivation of f(x) as autonomous func
% xRootGuess - (float) initial guess for the root
% errTol - (float) tolerance on approximate error
% 
% Outputs
% xRoots - (float array) estimated root after at each iteration

% Initilize current and previous roots, doesn't matter what they actually are
xRootNew = xRootGuess;
xRootOld = xRootGuess;

% Initialize error to infinity
errApprox = Inf;

% Initilize iteration counter
nIter = 0;

% Initialize xRoots Array
xRoots = []; 

while errApprox > errTol
	% Replace old root with the root found in previous step
	xRootOld = xRootNew;
	
	% Set up for new root guess
	xRootNew = xRootOld - f(xRootOld)/df(xRootOld);

	% Iterate the count up by 1
	nIter = nIter + 1;

	% Calculate new approximate error
	errApprox = abs((xRootNew - xRootOld)/xRootNew);

	% Add new root to list
	xRoots = [xRoots, xRootNew];

	% Print tracking metrics
	fprintf('Iteration n=%d, approx. error = %1.4e \n',nIter,errApprox);
    fprintf('\t Estimated root x_r = %1.4f \n',xRootNew);
end


end