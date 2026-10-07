function sorted = shell_sort(arr)
    sorted = arr;
    n = length(sorted);
    gap = floor(n / 2);
    while gap > 0
        for i = gap+1:n
            temp = sorted(i);
            j = i;
            while j > gap && sorted(j - gap) > temp
                sorted(j) = sorted(j - gap);
                j = j - gap;
            end
            sorted(j) = temp;
        end
        gap = floor(gap / 2);
    end
end

disp(shell_sort([12, 34, 54, 2, 3]))
