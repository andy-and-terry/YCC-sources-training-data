:- max_member(M, [3, 1, 4, 1, 5, 9, 2, 6]), writeln(M).
:- min_member(M, [3, 1, 4, 1, 5, 9, 2, 6]), writeln(M).
:- max_member(M, [apple, pear, fig]), writeln(M).

% max_member/3 takes a custom order predicate.
longer_or_equal(A, B) :- atom_length(A, LA), atom_length(B, LB), LA =< LB.
:- max_member(longer_or_equal, Longest, [fig, banana, kiwi, plum]), writeln(Longest).

:- max_list([2, 8, 3], Mx), min_list([2, 8, 3], Mn), format("~w ~w~n", [Mx, Mn]).
:- aggregate_all(max(Age-Name), member(Name-Age, [ann-31, bob-45, cy-27]), max(A-N)), writeln(N-A).
