-module(monotonic_stack).
-export([next_greater/1]).

next_greater(Nums) ->
    Indexed = lists:zip(lists:seq(0, length(Nums) - 1), Nums),
    Result = lists:duplicate(length(Nums), -1),
    {_Stack, Final} = lists:foldl(fun process/2, {[], Result}, Indexed),
    Final.

process({Index, Value}, {Stack, Result}) ->
    {Stack1, Result1} = resolve(Value, Stack, Result),
    {[{Index, Value} | Stack1], Result1}.

resolve(Value, [{Index, Top} | Rest], Result) when Top < Value ->
    Result1 = replace(Index, Value, Result),
    resolve(Value, Rest, Result1);
resolve(_Value, Stack, Result) -> {Stack, Result}.

replace(Index, Value, Result) ->
    {Before, [_ | After]} = lists:split(Index, Result),
    Before ++ [Value | After].
