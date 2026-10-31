function semiprime_check()
    found = [];
    for n = 2:29
        if numel(factor(n)) == 2
            found(end + 1) = n; %#ok<AGROW>
        end
    end
    disp(found);
end
