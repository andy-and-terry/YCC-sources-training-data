try
    error('app:bad', 'bad value %d', 7);
catch e
    disp(e.identifier)
    disp(e.message)
end
