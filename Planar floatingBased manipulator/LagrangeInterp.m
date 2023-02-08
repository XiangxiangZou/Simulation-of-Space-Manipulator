function y = LagrangeInterp(x, f, xi)
% x: known x-values
% f: known f(x)-values
% xi: x-value for which the interpolated value is desired
% y: interpolated value

% Initialize the output value
y = 0;

% Loop over each known data point
n = length(x);
for i = 1:n
    % Calculate the Lagrange basis polynomial
    L = 1;
    for j = 1:n
        if j ~= i
            L = L * (xi - x(j)) / (x(i) - x(j));
        end
    end
    
    % Add the contribution from this data point to the output value
    y = y + f(i) * L;
end
end
