:- atom_codes(hello, Cs), writeln(Cs).
:- atom_length(hello, N), writeln(N).
:- atom_concat(foo, bar, A), writeln(A).
:- sub_atom(hello, 1, 3, _, S), writeln(S).
:- atomic_list_concat(L, ',', 'a,b,c'), writeln(L).
