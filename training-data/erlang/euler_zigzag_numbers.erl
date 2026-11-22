-module(euler_zigzag_numbers).
-export([main/0]).

%% Euler zigzag numbers via the Seidel-Entringer boustrophedon.
step(Row) ->
    lists:reverse(lists:foldl(fun(X, [H | _] = Acc) -> [H + X | Acc] end, [0], lists:reverse(Row))).

rows(0, _) -> [];
rows(K, Row) -> [lists:last(Row) | rows(K - 1, step(Row))].

main() ->
    io:format("~s~n", [string:join([integer_to_list(X) || X <- rows(10, [1])], " ")]).
