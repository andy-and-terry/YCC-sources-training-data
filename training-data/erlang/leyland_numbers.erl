-module(leyland_numbers).
-export([main/0]).

%% Leyland numbers: X^Y + Y^X for X >= Y >= 2.
ipow(_, 0) -> 1;
ipow(B, E) -> B * ipow(B, E - 1).

leyland(X, Y) -> ipow(X, Y) + ipow(Y, X).

main() ->
    Vals = [leyland(X, Y) || X <- lists:seq(2, 4), Y <- lists:seq(2, X)],
    io:format("~s~n", [string:join([integer_to_list(V) || V <- Vals], " ")]).
