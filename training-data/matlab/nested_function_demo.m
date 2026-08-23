function result = outer_function(x)
    result = inner_double(x) + inner_triple(x);

    function y = inner_double(n)
        y = n * 2;
    end

    function y = inner_triple(n)
        y = n * 3;
    end
end
