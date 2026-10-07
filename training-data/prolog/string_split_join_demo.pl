:- split_string("a,b,,c", ",", "", Parts), writeln(Parts).
:- split_string("  hello  ", "", " ", [Trimmed]), writeln(Trimmed).
:- atomic_list_concat(Parts, ',', 'x,y,z'), writeln(Parts).
:- atomic_list_concat([a, b, c], '-', R), writeln(R).
:- string_concat("foo", "bar", S), string_upper(S, U), writeln(U).
:- sub_atom(hello_world, 6, 5, _, Sub), writeln(Sub).
:- sub_string("banana", B, _, 0, "ana"), writeln(B).
:- atom_string(A, "text"), atom_length(A, L), writeln(A/L).
:- number_codes(N, "42"), M is N * 2, writeln(M).
:- term_to_atom(foo(X, bar), A), writeln(A).
:- atom_number('3.14', N), writeln(N).
:- string_chars(S, [h, i]), string_code(1, S, C), writeln(S/C).
:- upcase_atom('mixed Case', U), writeln(U).
