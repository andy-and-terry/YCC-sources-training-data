% Composing anonymous functions and passing handles around.

compose = @(f, g) @(x) f(g(x));

inc    = @(x) x + 1;
square = @(x) x .^ 2;

incThenSquare = compose(square, inc);
squareThenInc = compose(inc, square);
fprintf('%d %d\n', incThenSquare(3), squareThenInc(3));

% Pipeline from a cell array of handles
steps = {inc, square, @sqrt};
pipeline = @(x) x;
for k = 1:numel(steps)
    pipeline = compose(steps{k}, pipeline);
end
fprintf('pipeline(3) = %.4f\n', pipeline(3));

% Handles capture variables at creation time
k = 10;
addK = @(x) x + k;
k = 99;
fprintf('addK(1) = %d\n', addK(1));

% Inspect a handle
disp(func2str(addK));
h = str2func('@(a, b) a * b');
fprintf('h(6,7) = %d\n', h(6, 7));

% Apply to arrays
vals = cellfun(@(f) f(4), {inc, square, @sqrt});
disp(vals);
