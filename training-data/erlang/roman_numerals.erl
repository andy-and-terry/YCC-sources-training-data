-module(roman_numerals).
-export([convert/1]).

values() ->
    [{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"},
     {90, "XC"}, {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"},
     {5, "V"}, {4, "IV"}, {1, "I"}].

convert(0) -> "";
convert(N) ->
    {Value, Symbol} = lists:keyfind(true, 1,
        [{V =< N, V, S} || {V, S} <- values()]),
    Symbol ++ convert(N - Value).
