# Bulls and Cows scoring for equal-length digit strings.
function score(secret, guess)
    bulls = count(((s, g),) -> s == g, zip(secret, guess))
    sc = Dict{Char,Int}()
    gc = Dict{Char,Int}()
    for (s, g) in zip(secret, guess)
        s == g && continue
        sc[s] = get(sc, s, 0) + 1
        gc[g] = get(gc, g, 0) + 1
    end
    cows = sum(min(n, get(gc, c, 0)) for (c, n) in sc; init = 0)
    return bulls, cows
end

b, c = score("1807", "7810")
println("$b bull(s), $c cow(s)")
