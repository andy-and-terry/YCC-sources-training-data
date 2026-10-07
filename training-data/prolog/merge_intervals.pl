% Merge overlapping intervals: sort by start, then fold left, extending
% the last kept interval whenever the next one overlaps it.
merge_intervals(Intervals, Merged) :-
    msort(Intervals, Sorted),
    merge_sorted(Sorted, Merged).

merge_sorted([], []).
merge_sorted([I], [I]) :- !.
merge_sorted([Lo1-Hi1, Lo2-Hi2|Rest], Merged) :-
    Lo2 =< Hi1, !,
    NewHi is max(Hi1, Hi2),
    merge_sorted([Lo1-NewHi|Rest], Merged).
merge_sorted([I|Rest], [I|Merged]) :-
    merge_sorted(Rest, Merged).

:- merge_intervals([1-3, 2-6, 8-10, 15-18], Merged), writeln(Merged).
