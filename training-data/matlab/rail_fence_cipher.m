function out = rail_fence_cipher(s, rails)
    n = length(s);
    period = 2 * (rails - 1);
    idx = mod(0:n-1, period);
    idx(idx >= rails) = period - idx(idx >= rails);
    [~, order] = sort(idx, 'stable');
    out = s(order);
end
