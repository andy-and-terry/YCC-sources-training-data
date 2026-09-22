using Base.Threads

function parallel_sum_of_squares(n::Int)
    partial = zeros(Int, nthreads())
    @threads for i in 1:n
        partial[threadid()] += i * i
    end
    return sum(partial)
end

function sequential_sum_of_squares(n::Int)
    total = 0
    for i in 1:n
        total += i * i
    end
    return total
end

println("threads available: ", nthreads())
println("parallel result:   ", parallel_sum_of_squares(1000))
println("sequential result: ", sequential_sum_of_squares(1000))
