function result = safe_divide(a, b)
    try
        if b == 0
            error('MyError:divByZero', 'cannot divide by zero');
        end
        result = a / b;
    catch err
        fprintf('error: %s\n', err.message);
        result = NaN;
    end
end
