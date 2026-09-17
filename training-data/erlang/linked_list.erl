-module(linked_list).
-export([new/0, cons/2, to_list/1, from_list/1, reverse/1, len/1]).

new() -> nil.

cons(Value, List) -> {Value, List}.

to_list(nil) -> [];
to_list({Value, Next}) -> [Value | to_list(Next)].

from_list([]) -> nil;
from_list([H | T]) -> {H, from_list(T)}.

reverse(List) -> reverse(List, nil).

reverse(nil, Acc) -> Acc;
reverse({Value, Next}, Acc) -> reverse(Next, {Value, Acc}).

len(nil) -> 0;
len({_, Next}) -> 1 + len(Next).
