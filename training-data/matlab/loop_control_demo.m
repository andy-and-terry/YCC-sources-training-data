% break and continue
for i = 1:10
    if mod(i, 2) == 0
        continue;
    end
    if i > 7
        break;
    end
    fprintf('%d ', i);
end
fprintf('\n');

% while loop with a convergence test
x = 1;
iterations = 0;
while abs(x^2 - 2) > 1e-10
    x = (x + 2 / x) / 2;
    iterations = iterations + 1;
end
fprintf('sqrt(2) = %.10f after %d iterations\n', x, iterations);

% looping over matrix columns
M = [1 2 3; 4 5 6];
for col = M
    fprintf('column sum = %d\n', sum(col));
end

% looping over cell array
names = {'ann', 'bob'};
for k = 1:numel(names)
    fprintf('%d: %s\n', k, names{k});
end

% do-while idiom
count = 0;
while true
    count = count + 1;
    if count >= 3
        break;
    end
end
disp(count);

for k = []
    disp('never runs');
end
