rev_atom(A, R) :- atom_chars(A, Cs), reverse(Cs, Rs), atom_chars(R, Rs).

% ?- rev_atom(hello, R).
