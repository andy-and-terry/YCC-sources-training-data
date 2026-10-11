-module(sort_with_fun_demo).
-export([run/0]).

run() ->
    People = [{"Zed", 30}, {"Amy", 25}, {"Bob", 30}, {"Cat", 22}],
    ByAge = lists:sort(fun({_, A}, {_, B}) -> A =< B end, People),
    io:format("~p~n", [ByAge]),
    ByAgeDescThenName = lists:sort(
                          fun({N1, A1}, {N2, A2}) ->
                                  {A1, N2} >= {A2, N1}
                          end, People),
    io:format("~p~n", [ByAgeDescThenName]),
    io:format("~p~n", [lists:sort(fun(A, B) -> length(A) =< length(B) end,
                                  ["ccc", "a", "bb", ""])]).
