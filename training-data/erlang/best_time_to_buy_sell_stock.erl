-module(best_time_to_buy_sell_stock).
-export([max_profit/1]).

max_profit([]) -> 0;
max_profit([First | Rest]) ->
    {_MinPrice, Best} = lists:foldl(fun(Price, {MinPrice, BestProfit}) ->
        {min(MinPrice, Price), max(BestProfit, Price - MinPrice)}
    end, {First, 0}, Rest),
    Best.
