function result = my_gcd(a, b)
    while b ~= 0
        temp = b;
        b = mod(a, b);
        a = temp;
    end
    result = a;
end
