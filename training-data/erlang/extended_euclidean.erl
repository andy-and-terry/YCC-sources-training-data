-module(extended_euclidean).
-export([extended_gcd/2, mod_inverse/2]).

extended_gcd(A, 0) -> {A, 1, 0};
extended_gcd(A, B) ->
    {G, X1, Y1} = extended_gcd(B, A rem B),
    {G, Y1, X1 - (A div B) * Y1}.

mod_inverse(A, M) ->
    {G, X, _Y} = extended_gcd(A, M),
    case G of
        1 -> (X rem M + M) rem M;
        _ -> undefined
    end.
