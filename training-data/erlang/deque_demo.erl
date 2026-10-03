-module(deque_demo).
-export([new/0, push_front/2, push_back/2, pop_front/1, pop_back/1, to_list/1]).

new() -> queue:new().

push_front(Value, Deque) -> queue:in_r(Value, Deque).

push_back(Value, Deque) -> queue:in(Value, Deque).

pop_front(Deque) ->
    {{value, Value}, Rest} = queue:out(Deque),
    {Value, Rest}.

pop_back(Deque) ->
    {{value, Value}, Rest} = queue:out_r(Deque),
    {Value, Rest}.

to_list(Deque) -> queue:to_list(Deque).
