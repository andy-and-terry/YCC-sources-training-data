-module(list_mode).
-export([main/0, modes/1]).

modes(Items) ->
    Counts = lists:foldl(fun(X, M) -> maps:update_with(X, fun(C) -> C + 1 end, 1, M) end, #{}, Items),
    Top = lists:max(maps:values(Counts)),
    lists:sort([K || {K, C} <- maps:to_list(Counts), C =:= Top]).

main() -> io:format("~p~n", [modes([1, 2, 2, 3, 3, 4])]).
