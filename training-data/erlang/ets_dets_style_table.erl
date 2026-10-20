-module(ets_dets_style_table).
-export([main/0]).

main() ->
    T = ets:new(items, [set, public]),
    ets:insert(T, [{apple, 3}, {pear, 5}]),
    ets:insert(T, {apple, 10}),
    io:format("~p~n", [ets:lookup(T, apple)]),
    io:format("~p~n", [ets:update_counter(T, pear, 2)]),
    io:format("~p~n", [lists:sort(ets:tab2list(T))]),
    io:format("~p~n", [ets:select(T, [{{'$1', '$2'}, [{'>', '$2', 6}], ['$1']}])]),
    ets:delete(T),
    io:format("~p~n", [ets:info(T)]).
