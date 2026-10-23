-module(collatz_sequence).
-export([run/0, path/1, steps/1]).

next(N) when N rem 2 =:= 0 -> N div 2;
next(N) -> 3 * N + 1.

path(N) when N > 0 -> path(N, []).

path(1, Acc) -> lists:reverse([1 | Acc]);
path(N, Acc) -> path(next(N), [N | Acc]).

steps(N) -> length(path(N)) - 1.

run() ->
    io:format("path for 6: ~p~n", [path(6)]),
    io:format("steps for 27: ~p~n", [steps(27)]),
    {Best, Count} = lists:foldl(
        fun(N, {_, C} = Acc) ->
            case steps(N) of
                S when S > C -> {N, S};
                _ -> Acc
            end
        end,
        {1, 0},
        lists:seq(1, 10000)),
    io:format("longest under 10000: ~p with ~p steps~n", [Best, Count]).
