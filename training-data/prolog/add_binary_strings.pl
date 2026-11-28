add_binary(A, B, Sum) :-
    atom_number_radix(A, NA), atom_number_radix(B, NB),
    S is NA + NB,
    format(atom(Sum), "~2r", [S]).

atom_number_radix(Atom, N) :-
    atom_chars(Atom, Cs),
    foldl([C, Acc, Out]>>(atom_number(C, D), Out is Acc * 2 + D), Cs, 0, N).

:- add_binary('1010', '1011', S), format("~w~n", [S]).  % 10101
