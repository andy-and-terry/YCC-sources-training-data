-module(doubly_linked_list).
-export([new/0, push_front/2, push_back/2, to_list/1, from_list/1]).

new() -> {[], []}.

push_front(Value, {Front, Back}) -> {[Value | Front], Back}.

push_back(Value, {Front, Back}) -> {Front, [Value | Back]}.

to_list({Front, Back}) -> Front ++ lists:reverse(Back).

from_list(List) -> {List, []}.
