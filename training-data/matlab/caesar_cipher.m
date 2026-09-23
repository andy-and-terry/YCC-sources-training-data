function encoded = caesar_encode(str, shift)
    encoded = char(mod(double(str) - double('a') + shift, 26) + double('a'));
end

function decoded = caesar_decode(str, shift)
    decoded = caesar_encode(str, -shift);
end

disp(caesar_encode('hello', 3))
disp(caesar_decode('khoor', 3))
