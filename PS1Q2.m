% Code for Problem Set 1 Question 2 MAE 107 SP26
% Problem Statement:
% Write a MATLAB script/function to construct the N-term Taylor series expansion of sin(-2x) in the range x = [0, 2pi], centered at x = 0
% So the best way to do this would be a function with input variable N which would represent the number of terms that the user wants to approximate to

function PS1Q2(N)
	steps = 1000;
	x = linspace(0,2*pi,steps); % Gives range of values from 0 to 2pi in steps, 1000 for this case
	syms xs
	f = sin(-2*xs); % Defining our function symbolically, we can also just recognize the pattern but I wanted to try this
	% The loop goes from 0 to N-1 since the number of terms after the 0th is N-1
	soln = 0;
	for i = 0:(N-1)
		ith_deriv = diff(f,xs,i); % Get ith derivative of the function with respect to xs
		coef = double(subs(ith_deriv, xs, 0)); % Get the coefficient for each term by substituting the center point into xs
		soln = soln + coef .* (x.^i) / factorial(i); % Now do the running sum for each i value
	end
	% Now we plot
	close all
	figure; % Opens new figure
	y_act = sin(-2*x); % Actual curve of sin given the x array defined above
	plot(x, y_act, '-', 'Linewidth', 1); % Plot it with a solid line
	hold on;
	plot(x,soln, '--', 'Linewidth', 1, 'Color', 'red') % Plot approximation to Nth term with dashed red line
	ylim([-1,1])
	xlabel('Range from 0 to 2pi')
	ylabel('Y Values')
	title("Taylor Series Approximation for Sin(-2x) Given " + N + " Terms")
	legend('Actual', 'Approximate')
end