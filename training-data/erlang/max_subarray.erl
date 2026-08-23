-module(max_subarray).
-export([kadane/1]).

kadane([H | T]) ->
    {Best, _Current} = lists:foldl(
        fun(X, {Best, Current}) ->
            NewCurrent = max(X, Current + X),
            {max(Best, NewCurrent), NewCurrent}
        end,
        {H, H},
        T
    ),
    Best.
