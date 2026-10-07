% Kth largest element via sorting (msort keeps duplicates, unlike
% sort/2 which would silently drop them).
kth_largest(List, K, Result) :-
    msort(List, Sorted),
    length(Sorted, N),
    Index is N - K,
    nth0(Index, Sorted, Result).

:- kth_largest([3, 2, 1, 5, 6, 4], 2, Result), writeln(Result).
:- kth_largest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4, Result2), writeln(Result2).
