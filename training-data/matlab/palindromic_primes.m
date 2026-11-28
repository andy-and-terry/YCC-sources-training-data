function palindromic_primes()
    result = [];
    for p = primes(199)
        s = num2str(p);
        if strcmp(s, fliplr(s))
            result(end + 1) = p;
        end
    end
    disp(result); % 2 3 5 7 11 101 131 151 181 191
end
