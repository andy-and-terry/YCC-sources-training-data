-module(lazy_caterer_sequence).
-export([main/0, term/1]).

%% n(n+1)/2+1
term(N) ->
    ((N * (N + 1)) div 2) + 1.

main() ->
    lists:foreach(
      fun(N) -> io:format("~2w -> ~w~n", [N, term(N)]) end,
      lists:seq(1, 15)).
