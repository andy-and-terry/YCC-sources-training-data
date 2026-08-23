-module(insertion_sort).
-export([sort/1]).

sort(List) -> lists:foldl(fun insert/2, [], List).

insert(X, []) -> [X];
insert(X, [H | T]) when X =< H -> [X, H | T];
insert(X, [H | T]) -> [H | insert(X, T)].
