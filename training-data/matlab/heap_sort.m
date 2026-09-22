function sorted = heap_sort(arr)
    sorted = arr;
    n = length(sorted);
    for i = floor(n / 2):-1:1
        sorted = heapify(sorted, n, i);
    end
    for i = n:-1:2
        temp = sorted(1);
        sorted(1) = sorted(i);
        sorted(i) = temp;
        sorted = heapify(sorted, i - 1, 1);
    end
end

function arr = heapify(arr, n, i)
    largest = i;
    left = 2 * i;
    right = 2 * i + 1;

    if left <= n && arr(left) > arr(largest)
        largest = left;
    end
    if right <= n && arr(right) > arr(largest)
        largest = right;
    end
    if largest ~= i
        temp = arr(i);
        arr(i) = arr(largest);
        arr(largest) = temp;
        arr = heapify(arr, n, largest);
    end
end
