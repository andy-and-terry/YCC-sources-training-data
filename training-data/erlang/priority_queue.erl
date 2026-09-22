-module(priority_queue).
-export([new/0, insert/3, pop/1, is_empty/1]).

new() -> [].

insert(Queue, Priority, Value) ->
    lists:merge(fun({P1, _}, {P2, _}) -> P1 =< P2 end, [{Priority, Value}], Queue).

pop([]) -> {error, empty};
pop([{_Priority, Value} | Rest]) -> {ok, Value, Rest}.

is_empty([]) -> true;
is_empty(_) -> false.
