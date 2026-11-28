a = [5 3 8 1 9 2 7 4 6 0 3 5];
bs = 4;
blk = sum(reshape(a, bs, []), 1);
l = 3; r = 10; s = 0; i = l;  % 1-based
while i <= r
    if mod(i - 1, bs) == 0 && i + bs - 1 <= r
        s = s + blk((i - 1) / bs + 1);
        i = i + bs;
    else
        s = s + a(i);
        i = i + 1;
    end
end
disp(s);
