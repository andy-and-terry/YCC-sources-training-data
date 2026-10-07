function arr = sift_down(arr, root, n)
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
            break
        end
        temp = arr(root);
        arr(root) = arr(largest);
        arr(largest) = temp;
        root = largest;
    end
end

function sorted = heap_sort(arr)
    n = numel(arr);
    for i = floor(n / 2):-1:1
        arr = sift_down(arr, i, n);
    end
    for i = n:-1:2
        temp = arr(1);
        arr(1) = arr(i);
        arr(i) = temp;
        arr = sift_down(arr, 1, i - 1);
    end
    sorted = arr;
end

disp(heap_sort([5 3 8 1 9 2]))
