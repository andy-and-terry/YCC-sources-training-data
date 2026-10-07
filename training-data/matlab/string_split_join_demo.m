csv = 'red,green,,blue';

parts = strsplit(csv, ',');
disp(numel(parts));
disp(parts);

parts2 = strsplit(csv, ',', 'CollapseDelimiters', true);
disp(numel(parts2));

joined = strjoin(parts, ' | ');
disp(joined);

words = strsplit('the quick  brown fox', ' ');
disp(strjoin(upper(words), '-'));

trimmed = strtrim(sprintf('   padded text \t\n'));
fprintf('[%s]\n', trimmed);

disp(strrep('banana', 'an', 'AN'));
disp(regexprep('a1b22c333', '\d+', '#'));
disp(upper('mixed Case'));
disp(strcat('ab', 'cd', 'ef'));
disp([repmat('-', 1, 10)]);

disp(startsWith('matlab', 'mat'));
disp(endsWith('matlab', 'lab'));
disp(contains('matlab', 'tla'));
disp(strfind('abcabc', 'bc'));

str = "string array element";
disp(split(str, ' ')');
disp(strlength(str));
