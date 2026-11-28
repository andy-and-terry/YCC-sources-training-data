function factorions()
    result = [];
    for n = 1:49999
        d = num2str(n) - '0';
        if sum(factorial(d)) == n
            result(end + 1) = n;
        end
    end
    disp(result); % 1 2 145 40585
end
