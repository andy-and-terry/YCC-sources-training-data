mutable struct CircularBuffer
    data::Vector{Int}
    capacity::Int
    size::Int
    start::Int
    CircularBuffer(cap::Int) = new(zeros(Int, cap), cap, 0, 0)
end

function push_buffer!(buf::CircularBuffer, value::Int)
    index = mod(buf.start + buf.size, buf.capacity) + 1
    buf.data[index] = value
    if buf.size < buf.capacity
        buf.size += 1
    else
        buf.start = mod(buf.start + 1, buf.capacity)
    end
end

function to_list(buf::CircularBuffer)
    return [buf.data[mod(buf.start + i, buf.capacity) + 1] for i in 0:buf.size-1]
end

buf = CircularBuffer(3)
for v in [1, 2, 3, 4, 5]
    push_buffer!(buf, v)
end
println(to_list(buf))
