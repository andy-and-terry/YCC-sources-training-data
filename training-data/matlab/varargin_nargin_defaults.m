function varargin_nargin_defaults()
    disp(scale_vec([1 2 3]));
    disp(scale_vec([1 2 3], 10));
    disp(scale_vec([1 2 3], 10, 1));
end

function out = scale_vec(v, factor, offset)
    if nargin < 2, factor = 2; end
    if nargin < 3, offset = 0; end
    out = v * factor + offset;
end
