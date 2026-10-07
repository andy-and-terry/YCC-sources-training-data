function sprintf_formatting_demo()
    fprintf('%d items at %.2f each\n', 3, 4.5);
    fprintf('%5s|%-5s|%05d\n', 'ab', 'cd', 42);
    fprintf('%e %g %x %o\n', 12345.678, 0.0001, 255, 8);
    s = sprintf('%d,', [1 2 3 4]);
    disp(s(1:end-1));
    fprintf('%d %d\n', [1 2; 3 4]);
    disp(num2str(pi, 8));
    disp(mat2str([1 2; 3 4.5]));
    disp(['Total: ' num2str(12.5) ' units']);
    fprintf('%s\n', strjoin({'a', 'b', 'c'}, ' - '));
    fprintf('%c%c%c\n', 72, 105, 33);
    fprintf('100%%\n');
end
