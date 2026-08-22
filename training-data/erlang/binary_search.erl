-module(binary_search).
-export([search/2]).

search(Tuple, Target) ->
    go(Tuple, Target, 1, tuple_size(Tuple)).

go(_Tuple, _Target, Low, High) when Low > High -> not_found;
go(Tuple, Target, Low, High) ->
    Mid = (Low + High) div 2,
    Value = element(Mid, Tuple),
    if
        Value =:= Target -> {found, Mid};
        Value < Target -> go(Tuple, Target, Mid + 1, High);
        true -> go(Tuple, Target, Low, Mid - 1)
    end.
