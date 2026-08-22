quicksort([], []).
quicksort([Pivot|Rest], Sorted) :-
    partition_list(Pivot, Rest, Smaller, Larger),
    quicksort(Smaller, SortedSmaller),
    quicksort(Larger, SortedLarger),
    append(SortedSmaller, [Pivot|SortedLarger], Sorted).

partition_list(_, [], [], []).
partition_list(Pivot, [H|T], [H|Smaller], Larger) :-
    H < Pivot, !,
    partition_list(Pivot, T, Smaller, Larger).
partition_list(Pivot, [H|T], Smaller, [H|Larger]) :-
    partition_list(Pivot, T, Smaller, Larger).

:- quicksort([5,3,8,1,9,2], Sorted), writeln(Sorted).
