function result = my_gcd(a, b)
    while b ~= 0
        t = b;
        b = mod(a, b);
        a = t;
    end
    result = abs(a);
end

function result = my_lcm(a, b)
    result = abs(a * b) / my_gcd(a, b);
end

disp(my_gcd(48, 18))
disp(my_lcm(4, 6))
