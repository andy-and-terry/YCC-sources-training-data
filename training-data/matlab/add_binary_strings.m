function s = add_binary(a, b)
  s = dec2bin(bin2dec(a) + bin2dec(b));
end

disp(add_binary('1010', '1011'))  % 10101
