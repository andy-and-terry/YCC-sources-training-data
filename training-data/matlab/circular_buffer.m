function buf = cb_new(capacity)
    buf.data = zeros(1, capacity);
    buf.capacity = capacity;
    buf.size = 0;
    buf.start = 0;
end

function buf = cb_push(buf, value)
    idx = mod(buf.start + buf.size, buf.capacity) + 1;
    buf.data(idx) = value;
    if buf.size < buf.capacity
        buf.size = buf.size + 1;
    else
        buf.start = mod(buf.start + 1, buf.capacity);
    end
end

buf = cb_new(3);
for v = [1, 2, 3, 4, 5]
    buf = cb_push(buf, v);
end
disp(buf.data)
