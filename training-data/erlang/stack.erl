-module(stack).
-export([new/0, push/2, pop/1, peek/1, is_empty/1]).

new() -> [].

push(Item, Stack) -> [Item | Stack].

pop([]) -> {error, empty};
pop([Head | Tail]) -> {ok, Head, Tail}.

peek([]) -> {error, empty};
peek([Head | _]) -> {ok, Head}.

is_empty([]) -> true;
is_empty(_) -> false.
