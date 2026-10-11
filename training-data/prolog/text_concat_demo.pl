:- atom_concat(foo, bar, A), writeln(A).
:- atom_concat(X, bar, foobar), writeln(X).
:- findall(X-Y, atom_concat(X, Y, abc), Splits), writeln(Splits).
:- string_concat("abc", "def", S), string(S), writeln(S).
:- atomic_list_concat([a, 1, "b", 2.5], R), writeln(R).
:- atomic_list_concat([x, y, z], '-', R), writeln(R).
:- atomic_list_concat(Parts, ',', 'one,two,three'), writeln(Parts).
:- atom_string(A, "from string"), writeln(A).
:- sub_string("hello world", 6, 5, _, Sub), writeln(Sub).
