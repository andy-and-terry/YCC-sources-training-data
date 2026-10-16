-module(luhn_check).
-export([run/0, valid/1]).

valid(Str) ->
    Digits = [C - $0 || C <- lists:reverse(Str), C =/= $\s],
    {Sum, _} = lists:foldl(
                 fun(D, {Acc, I}) when I rem 2 =:= 1 ->
                         D2 = D * 2,
                         {Acc + (if D2 > 9 -> D2 - 9; true -> D2 end), I + 1};
                    (D, {Acc, I}) -> {Acc + D, I + 1}
                 end, {0, 0}, Digits),
    Sum rem 10 =:= 0.

run() ->
    io:format("~p~n", [valid("4539 1488 0343 6467")]),
    io:format("~p~n", [valid("8273 1232 7352 0569")]),
    io:format("~p~n", [valid("79927398713")]).
