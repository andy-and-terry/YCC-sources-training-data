% Counting sort: a non-comparison sort that tallies how many times each
% value occurs, then expands the tally back into sorted order in O(n+k).
count_occurrences(List, Max, Counts) :-
    N is Max + 1,
    length(Zeros, N),
    maplist(=(0), Zeros),
    foldl(bump, List, Zeros, Counts).

bump(X, CountsIn, CountsOut) :-
    nth0(X, CountsIn, C),
    C1 is C + 1,
    replace_nth0(X, CountsIn, C1, CountsOut).

replace_nth0(0, [_|T], X, [X|T]) :- !.
replace_nth0(N, [H|T], X, [H|T1]) :- N > 0, N1 is N - 1, replace_nth0(N1, T, X, T1).

expand_counts(Counts, Sorted) :- expand_counts(Counts, 0, Sorted).
expand_counts([], _, []).
expand_counts([C|Cs], V, Sorted) :-
    length(Rep, C),
    maplist(=(V), Rep),
    V1 is V + 1,
    expand_counts(Cs, V1, Rest),
    append(Rep, Rest, Sorted).

counting_sort(List, Sorted) :-
    max_list(List, Max),
    count_occurrences(List, Max, Counts),
    expand_counts(Counts, Sorted).

:- counting_sort([4, 2, 2, 8, 3, 3, 1], Sorted), writeln(Sorted).
