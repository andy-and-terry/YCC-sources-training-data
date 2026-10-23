-module(game_of_life).
-export([run/0, step/1]).

neighbors({R, C}) ->
    [{R + DR, C + DC} || DR <- [-1, 0, 1], DC <- [-1, 0, 1], {DR, DC} =/= {0, 0}].

%% Live cells are kept in a sets:set(); counts are tallied in a map.
step(Alive) ->
    Counts = sets:fold(
        fun(Cell, Acc) ->
            lists:foldl(fun(N, M) -> maps:update_with(N, fun(V) -> V + 1 end, 1, M) end,
                        Acc, neighbors(Cell))
        end, #{}, Alive),
    sets:from_list([Cell || {Cell, N} <- maps:to_list(Counts),
                            N =:= 3 orelse (N =:= 2 andalso sets:is_element(Cell, Alive))]).

render(Alive, Rows, Cols) ->
    [[case sets:is_element({R, C}, Alive) of true -> $#; false -> $. end
      || C <- lists:seq(0, Cols - 1)] || R <- lists:seq(0, Rows - 1)].

run() ->
    Glider = sets:from_list([{0, 1}, {1, 2}, {2, 0}, {2, 1}, {2, 2}]),
    lists:foldl(
        fun(Gen, Alive) ->
            io:format("Generation ~p:~n", [Gen]),
            [io:format("~s~n", [Line]) || Line <- render(Alive, 5, 5)],
            step(Alive)
        end, Glider, lists:seq(0, 3)),
    ok.
