-module(cullen_numbers).
-export([main/0]).

cullen(N) -> N * (1 bsl N) + 1.

main() ->
    Nums = [integer_to_list(cullen(N)) || N <- lists:seq(0, 9)],
    io:format("~s~n", [lists:flatten(lists:join(" ", Nums))]).
