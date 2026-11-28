function automorphic_numbers()
    result = [];
    for n = 0:999
        sq = num2str(n^2);
        s = num2str(n);
        if numel(sq) >= numel(s) && strcmp(sq(end - numel(s) + 1:end), s)
            result(end + 1) = n;
        end
    end
    disp(result); % 0 1 5 6 25 76 376 625
end
