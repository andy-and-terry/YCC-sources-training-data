function sorted = bubble_sort(arr)
    sorted = arr;
    n = length(sorted);
    for i = 1:n-1
        for j = 1:n-i
            if sorted(j) > sorted(j+1)
                temp = sorted(j);
                sorted(j) = sorted(j+1);
                sorted(j+1) = temp;
            end
        end
    end
end
