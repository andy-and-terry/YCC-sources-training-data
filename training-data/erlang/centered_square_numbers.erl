-module(centered_square_numbers).
-export([main/0, term/1]).

%% 2n(n-1)+1
term(N) ->
    ((2 * N) * (N - 1)) + 1.

main() ->
    lists:foreach(
      fun(N) -> io:format("~2w -> ~w~n", [N, term(N)]) end,
      lists:seq(1, 15)).
