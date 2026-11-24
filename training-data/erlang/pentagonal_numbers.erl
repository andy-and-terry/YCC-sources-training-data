-module(pentagonal_numbers).
-export([main/0]).

%% Pentagonal numbers: n(3n-1)/2.
main() ->
    L = [N * (3 * N - 1) div 2 || N <- lists:seq(1, 10)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
