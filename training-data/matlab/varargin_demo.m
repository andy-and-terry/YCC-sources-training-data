function total = sum_all(varargin)
    total = 0;
    for i = 1:numel(varargin)
        total = total + varargin{i};
    end
end

function print_info(name, varargin)
    fprintf('name: %s\n', name);
    for i = 1:numel(varargin)
        fprintf('  extra: %s\n', num2str(varargin{i}));
    end
end

disp(sum_all(1, 2, 3, 4))
print_info('widget', 10, 20, 30)
