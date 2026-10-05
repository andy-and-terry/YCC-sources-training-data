% Moving average using conv and filter
x = [1 3 5 7 9 11 13 15];
w = 3;
ma_conv = conv(x, ones(1, w) / w, 'valid');
ma_filter = filter(ones(1, w) / w, 1, x);
disp(ma_conv);
disp(ma_filter(w:end));
disp(isequal(round(ma_conv, 10), round(ma_filter(w:end), 10)));
