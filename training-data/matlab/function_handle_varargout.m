function varargout = multi(varargin)
    for i = 1:nargout
        varargout{i} = varargin{i} * 2;
    end
end
[a, b] = multi(1, 2);
disp([a b])
