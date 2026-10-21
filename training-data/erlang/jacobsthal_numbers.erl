%% Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
-module(jacobsthal_numbers).
-export([main/0, terms/1]).

terms(Count) -> terms(Count, 0, 1, []).

terms(0, _, _, Acc) -> lists:reverse(Acc);
terms(N, A, B, Acc) -> terms(N - 1, B, B + 2 * A, [A | Acc]).

main() ->
    io:format("~s~n", [lists:join(" ", [integer_to_list(T) || T <- terms(15)])]).
