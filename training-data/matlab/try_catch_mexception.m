try
    A = [1 2 3];
    disp(A(5));
catch ME
    fprintf('id: %s\n', ME.identifier);
    fprintf('msg: %s\n', ME.message);
end

try
    error('Demo:badInput', 'Value %d is invalid', 42);
catch err
    disp(err.identifier);
    disp(err.message);
end
