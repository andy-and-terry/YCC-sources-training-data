-module(producer_consumer).
-export([run/0]).

producer(Consumer, []) ->
    Consumer ! {done, self()};
producer(Consumer, [Item | Rest]) ->
    Consumer ! {item, Item},
    producer(Consumer, Rest).

consumer(Owner, Acc) ->
    receive
        {item, Item} ->
            consumer(Owner, [Item | Acc]);
        {done, _From} ->
            Owner ! {result, lists:reverse(Acc)}
    end.

run() ->
    Self = self(),
    ConsumerPid = spawn(fun() -> consumer(Self, []) end),
    spawn(fun() -> producer(ConsumerPid, [1, 2, 3, 4, 5]) end),
    receive
        {result, Items} -> io:format("~p~n", [Items])
    end.
