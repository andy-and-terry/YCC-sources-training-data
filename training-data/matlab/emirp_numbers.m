function emirp_numbers()
    ps = primes(199);
    result = [];
    for p = ps
        r = str2double(fliplr(num2str(p)));
        if r ~= p && isprime(r)
            result(end + 1) = p;
        end
    end
    disp(result); % 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
end
