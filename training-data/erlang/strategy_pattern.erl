-module(strategy_pattern).
-export([checkout/2, by_price_ascending/0, by_price_descending/0, by_name/0]).

%% The GoF Strategy pattern is just passing a fun: instead of a family of
%% interchangeable "comparator objects", the caller hands `checkout/2` a
%% plain 2-arity fun to plug in the sort order it wants.

-record(item, {name, price}).

checkout(Items, Strategy) -> lists:sort(Strategy, Items).

by_price_ascending() ->
    fun(#item{price = P1}, #item{price = P2}) -> P1 =< P2 end.

by_price_descending() ->
    fun(#item{price = P1}, #item{price = P2}) -> P1 >= P2 end.

by_name() ->
    fun(#item{name = N1}, #item{name = N2}) -> N1 =< N2 end.

main() ->
    Items = [#item{name = "widget", price = 10},
             #item{name = "gadget", price = 25},
             #item{name = "gizmo", price = 5}],
    Cheapest = checkout(Items, by_price_ascending()),
    io:format("~p~n", [[N || #item{name = N} <- Cheapest]]).
