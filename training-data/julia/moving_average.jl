mutable struct MovingAverage
    buf::Vector{Float64}
    idx::Int
    count::Int
    total::Float64
    MovingAverage(size::Int) = new(zeros(size), 1, 0, 0.0)
end

function next!(ma::MovingAverage, v::Real)
    ma.total += v - ma.buf[ma.idx]
    ma.buf[ma.idx] = v
    ma.idx = mod1(ma.idx + 1, length(ma.buf))
    ma.count = min(ma.count + 1, length(ma.buf))
    return ma.total / ma.count
end

ma = MovingAverage(3)
println([round(next!(ma, v), digits = 2) for v in (1, 10, 3, 5, 8, 2)])
