-module(pentatope_numbers).
-export([main/0, term/1]).

%% n(n+1)(n+2)(n+3)/24
term(N) ->
    (((N * (N + 1)) * (N + 2)) * (N + 3)) div 24.

main() ->
    lists:foreach(
      fun(N) -> io:format("~2w -> ~w~n", [N, term(N)]) end,
      lists:seq(1, 15)).
