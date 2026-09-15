-module(rod_cutting).
-export([max_revenue/2]).

max_revenue(_Prices, 0) -> 0;
max_revenue(Prices, Length) ->
    Options = [
        element(Cut, Prices) + max_revenue(Prices, Length - Cut)
        || Cut <- lists:seq(1, Length), Cut =< tuple_size(Prices)
    ],
    lists:max(Options).

main() ->
    Prices = {1, 5, 8, 9, 10, 17, 17, 20},
    io:format("~p~n", [max_revenue(Prices, 8)]).
