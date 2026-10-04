fprintf('%d items\n', 42);
fprintf('[%5d] [%-5d] [%05d]\n', 42, 42, 42);
fprintf('%.3f | %10.2f | %e\n', pi, exp(1), 12345.678);
fprintf('%s and %s\n', 'left', 'right');
fprintf('[%10s] [%-10s]\n', 'right', 'left');
fprintf('%x %o %c\n', 255, 8, 65);
fprintf('%g %g\n', 0.0001, 100000);

% Vectors cycle through the format
fprintf('%d, ', 1:5);
fprintf('\n');
fprintf('%d-%d\n', [1 2; 3 4]);

s = sprintf('%d + %d = %d', 2, 3, 2 + 3);
disp(s);

disp(num2str(pi, 8));
disp(num2str([1 2 3]));
disp(mat2str([1 2; 3 4.5]));
disp(['Total: ', num2str(12.5), ' units']);
disp(int2str(3.7));

x = 42;
msg = sprintf('x = %d is %s', x, ifelse_str(mod(x, 2) == 0));
disp(msg);

fprintf('%6.2f%%\n', 99.5);
fprintf('Name: %s, Age: %d\n', 'Ada', 36);
disp(str2double('3.14') + 1);
disp(strcat('a', 'b', 'c'));

function s = ifelse_str(cond)
    if cond
        s = 'even';
    else
        s = 'odd';
    end
end
