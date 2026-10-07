function string_functions_demo()
    s = 'Hello, MATLAB World';
    disp(upper(s)); disp(strrep(s, 'World', 'There'));
    disp(strfind(s, 'l'));
    disp(strsplit('a,b,c', ','));
    disp(strtrim(sprintf('  pad \t')));
    disp(fliplr(s));
    disp(strcmpi('ABC', 'abc'));
    disp(regexprep(s, '\s+', '_'));
    disp(num2str(1234));
    disp(str2double('3.5e2'));
    disp(strcat('a', 'b', 'c'));
    disp(sum(s == 'l'));
    str = "double-quoted string";
    disp(strlength(str));
    disp(contains(str, 'quoted'));
    disp(extractBefore(str, '-'));
    disp(startsWith(s, 'Hello'));
    disp(lower(s(1:5)));
end
