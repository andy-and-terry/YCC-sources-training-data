:- atom_codes(abc, C), writeln(C).
:- atom_length(hello, L), writeln(L).
:- atomic_list_concat([a, b, c], '-', A), writeln(A).
:- atomic_list_concat(P, ',', 'x,y,z'), writeln(P).
:- upcase_atom(hello, U), writeln(U).
:- sub_atom(hello, 1, 3, _, S), writeln(S).
