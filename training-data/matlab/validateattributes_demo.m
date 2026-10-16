function validateattributes_demo(x, n)
    validateattributes(x, {'numeric'}, {'vector', 'positive'});
    validateattributes(n, {'numeric'}, {'scalar', 'integer', '>=', 1});
    fprintf('ok: %d values, n=%d\n', numel(x), n);
end
