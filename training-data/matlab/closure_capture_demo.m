function closure_capture_demo()
    adders = cell(1, 3);
    for k = 1:3
        adders{k} = @(x) x + k;
    end
    k = 100;
    for i = 1:3
        fprintf('%d ', adders{i}(10));
    end
    fprintf('\n');
    compose = @(f, g) @(x) f(g(x));
    h = compose(@sqrt, @abs);
    disp(h(-16));
end
