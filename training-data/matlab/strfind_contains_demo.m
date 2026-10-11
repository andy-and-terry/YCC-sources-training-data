s = 'the cat sat on the mat';
idx = strfind(s, 'at');
disp(idx);
disp(contains(s, 'cat'));
disp(startsWith(s, 'the'));
disp(endsWith(s, 'mat'));
disp(numel(strfind(s, 'the')));
