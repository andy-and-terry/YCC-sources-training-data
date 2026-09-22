% predsort/3 sorts with a custom 3-way comparator and drops elements the
% comparator calls equal, unlike msort/2 which keeps every duplicate.
compare_by_abs(Order, A, B) :-
    AbsA is abs(A), AbsB is abs(B),
    compare(Order, AbsA, AbsB).

:- msort([3, -1, 4, -1, 5, -9, 2], Sorted), writeln(Sorted).
:- predsort(compare_by_abs, [3, -1, 4, -1, 5, -9, 2], Result), writeln(Result).
