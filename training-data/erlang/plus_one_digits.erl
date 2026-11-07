-module(plus_one_digits).
-export([run/0, plus_one/1]).

plus_one(Digits) ->
    {Carry, Out} = lists:foldr(
        fun(D, {C, Acc}) ->
            S = D + C,
            {S div 10, [S rem 10 | Acc]}
        end,
        {1, []},
        Digits
    ),
    case Carry of
        0 -> Out;
        _ -> [Carry | Out]
    end.

run() ->
    io:format("~p~n", [plus_one([1, 2, 9])]),
    io:format("~p~n", [plus_one([9, 9])]).
