-module(ets_match_select_demo).
-export([run/0]).

run() ->
    T = ets:new(emp, [set]),
    ets:insert(T, [{1, ann, 50}, {2, bob, 70}, {3, cy, 90}]),
    io:format("~p~n", [lists:sort(ets:match(T, {'_', '$1', 70}))]),
    Spec = [{{'_', '$1', '$2'}, [{'>', '$2', 60}], ['$1']}],
    io:format("~p~n", [lists:sort(ets:select(T, Spec))]),
    io:format("~p~n", [ets:select_count(T, [{{'_', '_', '$1'}, [{'<', '$1', 80}], [true]}])]),
    io:format("~p~n", [ets:lookup_element(T, 2, 2)]),
    ets:delete(T).
