struct Countdown; n::Int; end
Base.iterate(c::Countdown, s=c.n) = s == 0 ? nothing : (s, s - 1)
Base.length(c::Countdown) = c.n

println(collect(Countdown(5)))
