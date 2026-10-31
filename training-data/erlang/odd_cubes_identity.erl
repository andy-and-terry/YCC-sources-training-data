-module(odd_cubes_identity).
-export([main/0]).

cube_from_odds(N) ->
    Start = N * N - N + 1,
    lists:sum([Start + 2 * I || I <- lists:seq(0, N - 1)]).

main() ->
    [io:format("~p ~p ~p~n", [N, cube_from_odds(N), cube_from_odds(N) =:= N * N * N])
     || N <- lists:seq(1, 5)],
    ok.
