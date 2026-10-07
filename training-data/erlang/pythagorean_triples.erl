-module(pythagorean_triples).
-export([triples/1]).

%% Uses a list comprehension with three generators and two filters (a
%% range restriction B >= A to avoid duplicate orderings, and the
%% Pythagorean equation itself) to find every triple {A, B, C} with
%% A =< B =< C =< N satisfying A*A + B*B =:= C*C.

triples(N) ->
    [{A, B, C} ||
        A <- lists:seq(1, N),
        B <- lists:seq(A, N),
        C <- lists:seq(B, N),
        A * A + B * B =:= C * C].

run() ->
    io:format("~p~n", [triples(20)]).
