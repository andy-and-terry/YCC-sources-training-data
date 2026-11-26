%% Squarefree numbers up to 100; expect 61.
-module(squarefree_numbers).
-export([main/0]).

squarefree(N) -> squarefree(N, 2).
squarefree(N, D) when D * D > N -> true;
squarefree(N, D) when N rem (D * D) =:= 0 -> false;
squarefree(N, D) -> squarefree(N, D + 1).

main() ->
    io:format("~p~n", [length([N || N <- lists:seq(1, 100), squarefree(N)])]).
