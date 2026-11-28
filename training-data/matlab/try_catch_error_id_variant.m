try
    error('demo:bad', 'Value %d is invalid', 7);
catch err
    fprintf('%s | %s\n', err.identifier, err.message);
end
