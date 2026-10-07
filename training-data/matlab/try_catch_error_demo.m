function try_catch_error_demo()
    try
        error('Demo:custom', 'Custom failure code %d', 42);
    catch ME
        fprintf('id=%s msg=%s\n', ME.identifier, ME.message);
    end

    try
        x = [1 2 3];
        y = x(5);
    catch ME
        disp(ME.identifier);
    end

    try
        a = ones(2, 3) * ones(2, 3);
    catch ME
        disp(ME.message);
    end

    disp(safe_sqrt(-4));
    disp(safe_sqrt('abc'));
end

function r = safe_sqrt(v)
    if ~isnumeric(v)
        r = NaN;
        return;
    end
    r = sqrt(complex(v));
end
