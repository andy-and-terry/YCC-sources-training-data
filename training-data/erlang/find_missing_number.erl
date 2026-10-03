-module(find_missing_number).
-export([find/2]).

find(Nums, N) ->
    Expected = N * (N + 1) div 2,
    Actual = lists:sum(Nums),
    Expected - Actual.
