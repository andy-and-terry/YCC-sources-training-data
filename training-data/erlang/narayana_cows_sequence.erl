-module(narayana_cows_sequence).
-export([main/0]).

%% Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
cows(0, _, _, _) -> [];
cows(N, A, B, C) -> [A | cows(N - 1, B, C, A + C)].

main() ->
    io:format("~s~n", [string:join([integer_to_list(X) || X <- cows(15, 1, 1, 1)], " ")]).
