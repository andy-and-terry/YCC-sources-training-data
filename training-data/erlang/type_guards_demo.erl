-module(type_guards_demo).
-export([run/0, kind/1]).

kind(X) when is_integer(X) -> integer;
kind(X) when is_float(X) -> float;
kind(X) when is_atom(X) -> atom;
kind(X) when is_binary(X) -> binary;
kind(X) when is_list(X) -> list;
kind(X) when is_tuple(X) -> tuple;
kind(X) when is_map(X) -> map;
kind(X) when is_function(X) -> function;
kind(X) when is_pid(X) -> pid;
kind(_) -> unknown.

run() ->
    Values = [1, 2.0, ok, <<"b">>, [1], {a}, #{}, fun() -> ok end, self(), make_ref()],
    lists:foreach(fun(V) -> io:format("~p~n", [kind(V)]) end, Values).
