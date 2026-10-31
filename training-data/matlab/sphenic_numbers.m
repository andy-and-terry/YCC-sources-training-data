function sphenic_numbers()
    found = [];
    for n = 2:79
        f = factor(n);
        if numel(f) == 3 && numel(unique(f)) == 3
            found(end + 1) = n; %#ok<AGROW>
        end
    end
    disp(found);
end
