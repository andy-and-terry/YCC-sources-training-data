function factorion_check()
    found = [];
    for n = 1:49999
        if sum(factorial(num2str(n) - '0')) == n
            found(end + 1) = n; %#ok<AGROW>
        end
    end
    disp(found);
end
