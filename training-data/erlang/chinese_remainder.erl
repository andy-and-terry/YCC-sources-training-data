-module(chinese_remainder).
-export([solve/2]).

solve(Remainders, Moduli) ->
    Prod = lists:foldl(fun(M, Acc) -> Acc * M end, 1, Moduli),
    Sum = lists:foldl(
            fun({R, M}, Acc) ->
                Ni = Prod div M,
                Inv = mod_inverse(Ni, M),
                Acc + R * Ni * Inv
            end,
            0,
            lists:zip(Remainders, Moduli)),
    Sum rem Prod.

mod_inverse(A, M) ->
    {G, X, _Y} = extended_gcd(A, M),
    case G of
        1 -> (X rem M + M) rem M;
        _ -> undefined
    end.

extended_gcd(A, 0) -> {A, 1, 0};
extended_gcd(A, B) ->
    {G, X1, Y1} = extended_gcd(B, A rem B),
    {G, Y1, X1 - (A div B) * Y1}.
