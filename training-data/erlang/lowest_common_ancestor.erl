-module(lowest_common_ancestor).
-export([lca/3]).

lca(nil, _P, _Q) -> nil;
lca({Value, _Left, _Right}, P, Q) when Value =:= P; Value =:= Q -> Value;
lca({_Value, Left, Right}, P, Q) ->
    LeftResult = lca(Left, P, Q),
    RightResult = lca(Right, P, Q),
    case {LeftResult, RightResult} of
        {nil, nil} -> nil;
        {nil, R} -> R;
        {L, nil} -> L;
        {_L, _R} -> found
    end.
