function [total, count] = sum_all(varargin)
    total = 0;
    count = numel(varargin);
    for i = 1:count
        total = total + varargin{i};
    end
end

function varargout = first_and_last(vec)
    varargout{1} = vec(1);
    if nargout > 1
        varargout{2} = vec(end);
    end
end

[s, c] = sum_all(1, 2, 3, 4);
fprintf('sum=%d count=%d\n', s, c);

[first, last] = first_and_last([10, 20, 30, 40]);
fprintf('first=%d last=%d\n', first, last);
