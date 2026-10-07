function arr = next_permutation(arr)
    n = length(arr);
    i = n - 1;
    while i >= 1 && arr(i) >= arr(i + 1)
        i = i - 1;
    end
    if i >= 1
        j = n;
        while arr(j) <= arr(i)
            j = j - 1;
        end
        tmp = arr(i); arr(i) = arr(j); arr(j) = tmp;
    end
    arr(i + 1:n) = fliplr(arr(i + 1:n));
end

disp(next_permutation([1, 2, 3]))
disp(next_permutation([3, 2, 1]))
disp(next_permutation([1, 1, 5]))
