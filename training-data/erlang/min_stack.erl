-module(min_stack).
-export([new/0, push/2, pop/1, min/1]).

new() -> {[], []}.

push(Value, {Stack, []}) -> {[Value | Stack], [Value]};
push(Value, {Stack, [MinTop | _] = Mins}) when Value =< MinTop ->
    {[Value | Stack], [Value | Mins]};
push(Value, {Stack, Mins}) -> {[Value | Stack], Mins}.

pop({[Top | Stack], [Top | Mins]}) -> {Top, {Stack, Mins}};
pop({[Top | Stack], Mins}) -> {Top, {Stack, Mins}}.

min({_Stack, [MinTop | _]}) -> MinTop.
