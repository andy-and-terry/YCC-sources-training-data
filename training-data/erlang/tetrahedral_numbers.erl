-module(tetrahedral_numbers).
-export([main/0, term/1]).

%% n(n+1)(n+2)/6
term(N) ->
    ((N * (N + 1)) * (N + 2)) div 6.

main() ->
    lists:foreach(
      fun(N) -> io:format("~2w -> ~w~n", [N, term(N)]) end,
      lists:seq(1, 15)).
