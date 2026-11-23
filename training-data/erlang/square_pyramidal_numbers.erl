-module(square_pyramidal_numbers).
-export([main/0, term/1]).

%% n(n+1)(2n+1)/6
term(N) ->
    ((N * (N + 1)) * ((2 * N) + 1)) div 6.

main() ->
    lists:foreach(
      fun(N) -> io:format("~2w -> ~w~n", [N, term(N)]) end,
      lists:seq(1, 15)).
