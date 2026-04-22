% Code for Problem Set 3 Question 2 MAE 107 SP26
% Problem uses bracketing methods in order to find numerically an x such that lnx = 2
% For part 1, we are tasked with using the bisection method to find the root of f(x) = ln(x) - 2
% Initial guesses are given as xl0 = 4 and xu0 = 9, and iterations must be made until the approximate error
% falls below 0.1 percent
% First we should define how our bisection method iterates
% It takes the exact mid point between lower and upper bounds as the guess for the root
% Then based on this roots function value (f(x_r)), it is either converted to the new upper or lower bound
% Next it's helpful to define what our approximate error is
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

	% We are taking the midpoint between the bounds
	xRootNew = abs(xLow + xUp)/2;

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



