-module(list_comprehension_pairs).
-export([pairs/1]).

pairs(N) -> [{X, Y} || X <- lists:seq(1, N), Y <- lists:seq(X, N), X + Y =:= N].
