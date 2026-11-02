macro mytime(ex)
    quote
        t0 = time()
        r = $(esc(ex))
        println("elapsed ", round(time() - t0; digits=4))
        r
    end
end
@mytime sum(1:10^6)
