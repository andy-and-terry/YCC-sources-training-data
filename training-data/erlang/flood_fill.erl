-module(flood_fill).
-export([fill/3, run/0]).

fill(Grid, Start, Color) ->
    Original = maps:get(Start, Grid),
    case Original =:= Color of
        true -> Grid;
        false -> fill(Grid, [Start], Original, Color)
    end.

fill(Grid, [], _Original, _Color) ->
    Grid;
fill(Grid, [{R, C} = Pos | Rest], Original, Color) ->
    case maps:get(Pos, Grid, undefined) of
        Original ->
            Neighbors = [{R + 1, C}, {R - 1, C}, {R, C + 1}, {R, C - 1}],
            fill(maps:put(Pos, Color, Grid), Neighbors ++ Rest, Original, Color);
        _ ->
            fill(Grid, Rest, Original, Color)
    end.

run() ->
    Rows = [[1, 1, 0], [1, 0, 0], [1, 1, 1]],
    Grid = maps:from_list([{{R, C}, V}
                           || {R, Row} <- lists:zip(lists:seq(0, 2), Rows),
                              {C, V} <- lists:zip(lists:seq(0, 2), Row)]),
    Filled = fill(Grid, {0, 0}, 7),
    [io:format("~p~n", [[maps:get({R, C}, Filled) || C <- lists:seq(0, 2)]])
     || R <- lists:seq(0, 2)],
    ok.
