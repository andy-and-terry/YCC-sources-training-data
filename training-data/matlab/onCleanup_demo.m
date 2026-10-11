function onCleanup_demo()
    cleaner = onCleanup(@() disp('cleanup ran'));
    disp('working');
    try
        error('Demo:fail', 'boom');
    catch ex
        disp(ex.message);
    end
    disp('done');
end
