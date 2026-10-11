names = {'ann', 'robert', 'li'};
for i = 1:numel(names)
    fprintf('|%-8s|%8s|\n', names{i}, upper(names{i}));
end
fprintf('%05.1f|%+d|%e\n', 3.14159, 7, 12345.678);
fprintf('%s\n', repmat('=', 1, 20));
