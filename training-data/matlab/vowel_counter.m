text = lower('Education is beautiful');
vowels = 'aeiou';
for v = vowels
    fprintf('%c=%d ', v, sum(text == v));
end
fprintf('\n');
