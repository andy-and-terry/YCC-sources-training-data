column_title(0, []) :- !.
column_title(N, Chars) :-
    M is N - 1,
    Q is M // 26, R is M mod 26, C is 0'A + R,
    column_title(Q, Prefix),
    append(Prefix, [C], Chars).

title_atom(N, Atom) :- column_title(N, Cs), atom_codes(Atom, Cs).

:- title_atom(28, A), title_atom(701, B), format("~w ~w~n", [A, B]).  % AB ZY
