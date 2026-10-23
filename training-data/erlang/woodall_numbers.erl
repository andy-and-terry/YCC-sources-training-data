-module(woodall_numbers).
-export([main/0]).

woodall(N) -> N * (1 bsl N) - 1.

main() ->
    Nums = [integer_to_list(woodall(N)) || N <- lists:seq(1, 10)],
    io:format("~s~n", [lists:flatten(lists:join(" ", Nums))]).
