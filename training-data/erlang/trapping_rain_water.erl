-module(trapping_rain_water).
-export([trap/1]).

trap(Heights) ->
    Arr = list_to_tuple(Heights),
    N = tuple_size(Arr),
    trap(Arr, 0, N - 1, 0, 0, 0).

trap(_Arr, Left, Right, _LeftMax, _RightMax, Water) when Left >= Right -> Water;
trap(Arr, Left, Right, LeftMax, RightMax, Water) ->
    LeftVal = element(Left + 1, Arr),
    RightVal = element(Right + 1, Arr),
    case LeftVal < RightVal of
        true ->
            NewLeftMax = max(LeftMax, LeftVal),
            trap(Arr, Left + 1, Right, NewLeftMax, RightMax, Water + NewLeftMax - LeftVal);
        false ->
            NewRightMax = max(RightMax, RightVal),
            trap(Arr, Left, Right - 1, LeftMax, NewRightMax, Water + NewRightMax - RightVal)
    end.
