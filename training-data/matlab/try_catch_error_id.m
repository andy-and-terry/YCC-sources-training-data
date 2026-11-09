try
    error('App:bad', 'Bad value: %d', 7);
catch ex
    fprintf('%s | %s\n', ex.identifier, ex.message);
end
