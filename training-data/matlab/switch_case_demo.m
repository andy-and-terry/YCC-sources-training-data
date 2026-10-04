function description = describe_number(n)
    switch true
        case n < 0
            description = 'negative';
        case n == 0
            description = 'zero';
        case mod(n, 2) == 0
            description = 'even';
        otherwise
            description = 'odd';
    end
end
