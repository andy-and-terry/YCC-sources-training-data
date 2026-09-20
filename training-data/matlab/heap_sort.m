function arr = heap_sort(arr)
    n = length(arr);
    for i = floor(n / 2):-1:1
        arr = heapify(arr, n, i);
    end
    for i = n:-1:2
        temp = arr(1);
        arr(1) = arr(i);
        arr(i) = temp;
        arr = heapify(arr, i - 1, 1);
    end
end

function arr = heapify(arr, heap_size, root)
    largest = root;
    left = 2 * root;
    right = 2 * root + 1;

    if left <= heap_size && arr(left) > arr(largest)
        largest = left;
    end
    if right <= heap_size && arr(right) > arr(largest)
        largest = right;
    end
    if largest ~= root
        temp = arr(root);
        arr(root) = arr(largest);
        arr(largest) = temp;
        arr = heapify(arr, heap_size, largest);
    end
end

disp(heap_sort([9 4 7 1 3 8 2 6 5]))
