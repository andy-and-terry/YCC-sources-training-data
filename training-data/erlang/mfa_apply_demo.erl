-module(mfa_apply_demo).
-export([main/0, shout/1, join/2]).

shout(Word) -> string:uppercase(Word) ++ "!".

join(A, B) -> A ++ "-" ++ B.

main() ->
    io:format("~p~n", [apply(lists, reverse, [[1, 2, 3]])]),
    io:format("~p~n", [apply(?MODULE, shout, ["hey"])]),
    io:format("~p~n", [erlang:apply(fun ?MODULE:join/2, ["a", "b"])]),
    F = fun erlang:max/2,
    io:format("~p~n", [F(3, 8)]),
    io:format("~p~n", [erlang:function_exported(?MODULE, shout, 1)]),
    Dynamic = list_to_atom("shout"),
    io:format("~p~n", [?MODULE:Dynamic("dyn")]),
    io:format("~p~n", [[M:F2(1) || {M, F2} <- [{erlang, integer_to_list}, {erlang, float}]]]),
    {_Micros, Result} = timer:tc(?MODULE, shout, ["time"]),
    io:format("~p~n", [Result]).
