try
    error('MyPkg:badInput', 'Value %d is invalid', 7);
catch ME
    disp(ME.identifier);
    disp(ME.message);
end
