macro twice(ex)
    quote
        $(esc(ex))
        $(esc(ex))
    end
end

x = Ref(0)
@twice x[] += 5
println(x[])
println(@macroexpand @twice println("hi"))
