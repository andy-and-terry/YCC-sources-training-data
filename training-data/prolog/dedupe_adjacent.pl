% Remove consecutive duplicates.
dedupe([], []).
dedupe([X], [X]).
dedupe([X, X|T], R) :- !, dedupe([X|T], R).
dedupe([X, Y|T], [X|R]) :- dedupe([Y|T], R).
:- atom_chars(aabbbcdd, L), dedupe(L, R), atom_chars(A, R), print(A), nl.
