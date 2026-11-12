:- initialization(main).
main :- atom_length(hello, L), writeln(L),
        atom_chars(abc, Cs), writeln(Cs),
        upcase_atom(hello, U), writeln(U),
        atomic_list_concat([a,b,c], '-', J), writeln(J),
        split_string("a,b,c", ",", "", Parts), writeln(Parts).
