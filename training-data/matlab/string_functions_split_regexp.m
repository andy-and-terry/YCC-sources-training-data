s = 'a,b,c';
parts = strsplit(s, ',');
disp(numel(parts))
disp(upper(strjoin(parts, '-')))
tok = regexp('x=12', '(\w)=(\d+)', 'tokens');
disp(tok{1})
