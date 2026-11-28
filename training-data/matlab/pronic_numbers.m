function pronic_numbers()
    n = 0:9;
    disp(n .* (n + 1));               % 0 2 6 12 20 30 42 56 72 90
    fprintf('%d %d\n', is_pronic(56), is_pronic(57)); % 1 0
end

function tf = is_pronic(x)
    n = floor(sqrt(x));
    tf = (n * (n + 1) == x);
end
