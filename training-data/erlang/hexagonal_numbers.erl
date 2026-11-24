-module(hexagonal_numbers).
-export([main/0]).

%% Hexagonal numbers: n(2n-1).
main() ->
    L = [N * (2 * N - 1) || N <- lists:seq(1, 10)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
