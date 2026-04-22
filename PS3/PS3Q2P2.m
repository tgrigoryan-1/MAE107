% Code for Problem Set 3 Question 2 MAE 107 SP26
% Problem uses bracketing methods in order to find numerically an x such that lnx = 2
% For part 2, it asks us to use the false position method and compare the results to the previous part
% The false positioning method utilizes the shape of the graph to allow us to get a quicker convergence to the root
% The geometrical understanding of the false positioning method is different than that of the bisection methods
% It utilizes the function output of the bounds (i.e. f(xUp) and f(xLow)) and draws a line between them and uses the x-axis
% intercept as the new root
% Our approximate error is defined the same way
% e_a = 100*abs(Current Guess - Previous Guess / Current Guess)

close all, clear

% Define function whose root we have to find
f = @(x) log(x) - 2;

% Initialize bounds
xUp = 9;
xLow = 4;

% Initialize two root guesses to the initial boundary values
xRootOld = xLow;
xRootNew = xUp;

% Initialize error to infinity
errApprox = Inf;

% Initilize iteration counter
nIter = 0;

% Start while loop that keeps going until error is less than 0.001
while errApprox > 0.001
	% Replace old root with the root found in previous step
	xRootOld = xRootNew;

	% We use the equation xUp - (f(xUp)*(xLow - xUp))/(f(xLow) - f(xUp)) as the equation for our root
	xRootNew = xUp - (f(xUp)*(xLow - xUp))/(f(xLow) - f(xUp));

	% Iterate the count up by 1
	nIter = nIter + 1;

	% Calculate new approximate error
	errApprox = abs((xRootNew - xRootOld)/xRootNew);

	% Need to check where this new root falls and update the bounds accordingly
	if f(xRootNew)*f(xUp) < 0 % Checks if root is in upper half
		xLow = xRootNew;
	elseif f(xRootNew)*f(xUp) > 0 % Checks if root is in lower half
		xUp = xRootNew;
	else % If in neither half, then it is the true root
		disp('True root found! Stopping iteration');
        break;
    end

    % Print tracking metrics
    fprintf('Iteration n=%d, approx. error = %1.4e \n',nIter,errApprox);
    fprintf('\t Estimated root x_r = %1.4f \n',xRootNew);
    fprintf('\t Residual f(x_r) = %1.4e \n',f(xRootNew));
end