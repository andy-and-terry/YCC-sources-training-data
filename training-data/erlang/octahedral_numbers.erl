-module(octahedral_numbers).
-export([main/0, term/1]).

%% n(2n^2+1)/3
term(N) ->
    (N * (((2 * N) * N) + 1)) div 3.

main() ->
    lists:foreach(
      fun(N) -> io:format("~2w -> ~w~n", [N, term(N)]) end,
      lists:seq(1, 15)).
