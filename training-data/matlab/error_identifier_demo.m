try
    error('MyPkg:badInput', 'Value %d is out of range [%d, %d]', 15, 0, 10);
catch ex
    fprintf('id: %s\n', ex.identifier);
    fprintf('msg: %s\n', ex.message);
    if strcmp(ex.identifier, 'MyPkg:badInput')
        disp('handled bad input');
    end
end
try
    x = [1 2 3];
    x(5)
catch ex
    disp(ex.identifier);
end
