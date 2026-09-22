function arr = sift_down(arr, n, root)
    while true
        largest = root;
        left = 2 * root;
        right = 2 * root + 1;
        if left <= n && arr(left) > arr(largest)
            largest = left;
        end
        if right <= n && arr(right) > arr(largest)
            largest = right;
        end
        if largest == root
            break;
        end
        temp = arr(root);
        arr(root) = arr(largest);
        arr(largest) = temp;
        root = largest;
    end
end

function sorted = heap_sort(items)
    arr = items;
    n = numel(arr);
    for i = floor(n / 2):-1:1
        arr = sift_down(arr, n, i);
    end
    for i = n:-1:2
        temp = arr(1);
        arr(1) = arr(i);
        arr(i) = temp;
        arr = sift_down(arr, i - 1, 1);
    end
    sorted = arr;
end
