-module(perrin_numbers).
-export([main/0]).

%% Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
perrin(0, _, _, _) -> [];
perrin(N, A, B, C) -> [A | perrin(N - 1, B, C, A + B)].

main() ->
    io:format("~s~n", [string:join([integer_to_list(P) || P <- perrin(15, 3, 0, 2)], " ")]).
