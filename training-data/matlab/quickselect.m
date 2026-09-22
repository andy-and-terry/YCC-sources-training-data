function result = quickselect(arr, k)
    a = arr;
    left = 1;
    right = length(a);
    while true
        pivot = a(right);
        store = left;
        for i = left:right - 1
            if a(i) < pivot
                temp = a(i);
                a(i) = a(store);
                a(store) = temp;
                store = store + 1;
            end
        end
        temp = a(store);
        a(store) = a(right);
        a(right) = temp;
        if k == store
            result = a(k);
            return
        elseif k < store
            right = store - 1;
        else
            left = store + 1;
        end
    end
end
