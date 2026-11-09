-module(fold_map_functional).
-export([sum_squares/1]).

sum_squares(L) -> lists:foldl(fun(X, A) -> A + X * X end, 0, L).
