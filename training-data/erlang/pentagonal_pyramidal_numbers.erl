-module(pentagonal_pyramidal_numbers).
-export([main/0, term/1]).

%% n^2(n+1)/2
term(N) ->
    ((N * N) * (N + 1)) div 2.

main() ->
    lists:foreach(
      fun(N) -> io:format("~2w -> ~w~n", [N, term(N)]) end,
      lists:seq(1, 15)).
