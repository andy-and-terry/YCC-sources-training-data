macro twice(ex)
    quote
        $(esc(ex))
        $(esc(ex))
    end
end

@twice println("hi")
