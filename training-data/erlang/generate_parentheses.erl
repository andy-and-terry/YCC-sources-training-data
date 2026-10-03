-module(generate_parentheses).
-export([generate/1]).

generate(N) -> backtrack("", 0, 0, N).

backtrack(Current, Open, Close, Max) when length(Current) =:= Max * 2 ->
    [Current];
backtrack(Current, Open, Close, Max) ->
    WithOpen = case Open < Max of
        true -> backtrack(Current ++ "(", Open + 1, Close, Max);
        false -> []
    end,
    WithClose = case Close < Open of
        true -> backtrack(Current ++ ")", Open, Close + 1, Max);
        false -> []
    end,
    WithOpen ++ WithClose.
