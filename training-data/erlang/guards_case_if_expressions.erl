-module(guards_case_if_expressions).
-export([main/0]).

classify(N) when is_integer(N), N < 0 -> negative;
classify(0) -> zero;
classify(N) when is_integer(N), N rem 2 =:= 0 -> even;
classify(N) when is_integer(N) -> odd;
classify(X) when is_atom(X); is_binary(X) -> other.

main() ->
    io:format("~p~n", [[classify(X) || X <- [-3, 0, 4, 7, foo, <<"b">>]]]),
    R = case {1, 2} of {A, B} when A > B -> gt; {A, B} when A < B -> lt; _ -> eq end,
    V = if R =:= lt -> small; true -> big end,
    io:format("~p ~p~n", [R, V]).
