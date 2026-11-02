-module(list_comprehension_pythag_x2).
-export([triples/1]).

triples(N) ->
    [{A, B, C} || A <- lists:seq(1, N), B <- lists:seq(A, N), C <- lists:seq(B, N), A*A + B*B =:= C*C].
