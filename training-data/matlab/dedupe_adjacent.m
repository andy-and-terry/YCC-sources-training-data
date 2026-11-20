% Remove consecutive duplicate characters.
s = 'aabbbcdd';
keep = [true, s(2:end) ~= s(1:end-1)];
disp(s(keep))
