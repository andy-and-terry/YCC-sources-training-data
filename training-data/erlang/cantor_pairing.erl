-module(cantor_pairing).
-export([main/0]).

%% Cantor pairing function and its inverse.
pair(X, Y) -> (X + Y) * (X + Y + 1) div 2 + Y.

unpair(Z) ->
    W = (trunc(math:sqrt(8 * Z + 1)) - 1) div 2,
    Y = Z - W * (W + 1) div 2,
    {W - Y, Y}.

main() ->
    io:format("~p~n", [pair(3, 4)]),
    {X, Y} = unpair(32),
    io:format("~p ~p~n", [X, Y]).
