function emirps()
    out = [];
    n = 2;
    while numel(out) < 10
        r = str2double(fliplr(num2str(n)));
        if r ~= n && isprime(n) && isprime(r)
            out(end + 1) = n; %#ok<AGROW>
        end
        n = n + 1;
    end
    disp(out); % 13 17 31 37 71 73 79 97 107 113
end
