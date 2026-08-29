edit_distance([], [], 0) :- !.
edit_distance([], [_|T2], D) :- !, edit_distance([], T2, D1), D is D1 + 1.
edit_distance([_|T1], [], D) :- !, edit_distance(T1, [], D1), D is D1 + 1.
edit_distance([H|T1], [H|T2], D) :- !, edit_distance(T1, T2, D).
edit_distance([H1|T1], [H2|T2], D) :-
    H1 \= H2,
    edit_distance(T1, T2, D1),
    edit_distance(T1, [H2|T2], D2),
    edit_distance([H1|T1], T2, D3),
    D is min(D1, min(D2, D3)) + 1.

:- string_chars("kitten", A), string_chars("sitting", B),
   edit_distance(A, B, D), writeln(D).
