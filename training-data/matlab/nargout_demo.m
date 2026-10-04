function nargout_demo()
    [a, b, c] = stats_multi([4 8 15 16 23 42]);
    fprintf('mean=%.2f median=%.1f std=%.2f\n', a, b, c);

    only_mean = stats_multi([1 2 3]);
    disp(only_mean);

    [~, med] = stats_multi([9 1 5]);
    disp(med);

    disp(describe());
    describe();
    result = describe('x');
    disp(result);
end

function [m, med, s] = stats_multi(x)
    m = mean(x);
    if nargout > 1
        med = median(x);
    end
    if nargout > 2
        s = std(x);
    end
    fprintf('called with nargout=%d\n', nargout);
end

function out = describe(varargin)
    if nargin == 0
        out = 'no arguments';
    else
        out = sprintf('%d argument(s), first is %s', nargin, class(varargin{1}));
    end
    if nargout == 0
        disp('result not captured');
    end
end
