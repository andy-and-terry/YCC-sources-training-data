-module(jaccard_similarity).
-export([main/0]).

jaccard(A, B) ->
    SA = sets:from_list(A),
    SB = sets:from_list(B),
    U = sets:size(sets:union(SA, SB)),
    case U of
        0 -> 1.0;
        _ -> sets:size(sets:intersection(SA, SB)) / U
    end.

main() -> io:format("~p~n", [jaccard([1, 2, 3, 4], [3, 4, 5])]).
