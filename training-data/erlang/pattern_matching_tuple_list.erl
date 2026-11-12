-module(pm_tuple_list).
-export([main/0]).
area({circle, R}) -> 3.14159 * R * R;
area({rect, W, H}) -> W * H.
main() ->
    [io:format("~p~n", [area(S)]) || S <- [{circle, 1}, {rect, 2, 3}]],
    [H | T] = [1, 2, 3],
    io:format("~p ~p~n", [H, T]).
