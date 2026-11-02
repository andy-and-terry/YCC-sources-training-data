try
    error('demo:bad', 'Value %d is bad', 7);
catch e
    disp(e.identifier)
    disp(e.message)
end
