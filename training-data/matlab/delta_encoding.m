function [d, back] = delta_encoding(x)
    d = [x(1), diff(x)];
    back = cumsum(d);
end
