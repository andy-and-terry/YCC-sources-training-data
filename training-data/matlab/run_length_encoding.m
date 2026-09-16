function encoded = run_length_encoding(str)
    encoded = '';
    n = length(str);
    if n == 0
        return;
    end
    count = 1;
    for i = 2:n
        if str(i) == str(i - 1)
            count = count + 1;
        else
            encoded = [encoded, str(i - 1), num2str(count)];
            count = 1;
        end
    end
    encoded = [encoded, str(n), num2str(count)];
end

disp(run_length_encoding('aaabbbcca'))
disp(run_length_encoding('abcd'))
