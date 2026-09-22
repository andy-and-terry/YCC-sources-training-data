text = 'Contact: alice@example.com or bob.jones@mail.co.uk for details.';

emails = regexp(text, '[\w.+-]+@[\w-]+\.[\w.-]+', 'match');
disp(emails)

digits_only = regexprep('Order #4521, Item #17', '\D', '');
disp(digits_only)

[tokens, matches] = regexp('2026-09-11', '(\d+)-(\d+)-(\d+)', 'tokens', 'match');
disp(tokens{1})
disp(matches{1})

has_number = ~isempty(regexp('room42', '\d+', 'once'));
disp(has_number)
