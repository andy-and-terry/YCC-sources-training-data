csv = 'alpha,beta,,gamma';

parts = strsplit(csv, ',');
disp(numel(parts))
disp(parts)

parts2 = strsplit(csv, ',', 'CollapseDelimiters', true);
disp(numel(parts2))

joined = strjoin(parts, ' | ');
disp(joined)

words = strsplit('the quick  brown fox', ' ');
disp(numel(words))

nums = cellfun(@str2double, strsplit('1,2,3.5', ','));
disp(nums)
disp(sum(nums))

disp(strtrim(sprintf('  padded \t')))
disp(upper('mixed Case'))
disp(strrep('a-b-c', '-', '+'))
disp(strcmpi('ABC', 'abc'))
disp(strncmp('hello', 'help', 3))
disp(strfind('abcabc', 'bc'))
disp(regexprep('a1b2', '\d', '#'))
[tok, rest] = strtok('key=value', '=');
fprintf('%s / %s\n', tok, rest(2:end));
