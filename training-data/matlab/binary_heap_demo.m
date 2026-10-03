function heap = heap_push(heap, value)
    heap(end + 1) = value;
    i = numel(heap);
    while i > 1 && heap(floor(i / 2)) > heap(i)
        parent = floor(i / 2);
        tmp = heap(parent); heap(parent) = heap(i); heap(i) = tmp;
        i = parent;
    end
end

function [top, heap] = heap_pop(heap)
    top = heap(1);
    heap(1) = heap(end);
    heap(end) = [];
    i = 1;
    n = numel(heap);
    while true
        left = 2 * i; right = 2 * i + 1;
        smallest = i;
        if left <= n && heap(left) < heap(smallest), smallest = left; end
        if right <= n && heap(right) < heap(smallest), smallest = right; end
        if smallest == i, break; end
        tmp = heap(smallest); heap(smallest) = heap(i); heap(i) = tmp;
        i = smallest;
    end
end

heap = [];
for v = [5, 3, 8, 1, 9, 2]
    heap = heap_push(heap, v);
end

sorted = [];
while ~isempty(heap)
    [top, heap] = heap_pop(heap);
    sorted(end + 1) = top;
end
disp(sorted)
