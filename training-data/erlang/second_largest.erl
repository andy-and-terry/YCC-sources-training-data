-module(second_largest).
-export([find/1]).

find([First, Second | Rest]) ->
    {Largest, SecondLargest} = case First > Second of
        true -> {First, Second};
        false -> {Second, First}
    end,
    find(Rest, Largest, SecondLargest).

find([], _Largest, SecondLargest) -> SecondLargest;
find([Value | Rest], Largest, SecondLargest) when Value > Largest ->
    find(Rest, Value, Largest);
find([Value | Rest], Largest, SecondLargest) when Value > SecondLargest, Value < Largest ->
    find(Rest, Largest, Value);
find([_Value | Rest], Largest, SecondLargest) ->
    find(Rest, Largest, SecondLargest).
