-module(foldl_map_merge_x2).
-export([count/1]).

count(L) -> lists:foldl(fun(X, M) -> maps:update_with(X, fun(V) -> V + 1 end, 1, M) end, #{}, L).
