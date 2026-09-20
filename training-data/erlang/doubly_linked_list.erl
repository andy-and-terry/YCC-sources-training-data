-module(doubly_linked_list).
-export([from_list/1, to_list/1, forward/1, backward/1, current/1,
         insert_after/2, delete_current/1]).

%% Erlang has no mutable pointers, so a "doubly linked list" is modeled as a
%% zipper: {Before, Current, After}, where Before is the reversed prefix and
%% After is the suffix. Moving forward/backward is O(1), matching what a
%% real doubly linked list gives you.

from_list([]) -> {[], none, []};
from_list([H | T]) -> {[], H, T}.

to_list({Before, none, After}) -> lists:reverse(Before) ++ After;
to_list({Before, Current, After}) -> lists:reverse(Before) ++ [Current | After].

current({_Before, none, _After}) -> none;
current({_Before, Current, _After}) -> {value, Current}.

forward({Before, Current, [Next | Rest]}) -> {[Current | Before], Next, Rest};
forward({Before, Current, []}) -> {Before, Current, []}.

backward({[Prev | Before], Current, After}) -> {Before, Prev, [Current | After]};
backward({[], Current, After}) -> {[], Current, After}.

insert_after({Before, Current, After}, Value) -> {Before, Current, [Value | After]}.

delete_current({Before, _Current, [Next | Rest]}) -> {Before, Next, Rest};
delete_current({[Prev | Before], _Current, []}) -> {Before, Prev, []};
delete_current({[], _Current, []}) -> {[], none, []}.

main() ->
    List0 = from_list([1, 2, 3]),
    List1 = forward(List0),
    List2 = insert_after(List1, 99),
    io:format("~p~n", [to_list(List2)]).
