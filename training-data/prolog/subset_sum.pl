subset_sum([], 0, []).
subset_sum([H|T], Target, [H|Rest]) :-
    H =< Target,
    Target1 is Target - H,
    subset_sum(T, Target1, Rest).
subset_sum([_|T], Target, Subset) :-
    subset_sum(T, Target, Subset).

has_subset_sum(Nums, Target) :-
    subset_sum(Nums, Target, _), !.

:- (has_subset_sum([3, 34, 4, 12, 5, 2], 9) -> writeln(true) ; writeln(false)).
:- (has_subset_sum([3, 34, 4, 12, 5, 2], 10) -> writeln(true) ; writeln(false)).
:- (has_subset_sum([3, 34, 4, 12, 5, 2], 40) -> writeln(true) ; writeln(false)).
:- (has_subset_sum([3, 34, 4, 12, 5, 2], 11) -> writeln(true) ; writeln(false)).
