% Splitting and joining text with split_string/4 and atomic_list_concat/3.
:- split_string("a,b,,c", ",", "", Parts), writeln(Parts).
:- split_string("  hello  ", "", " ", [Trimmed]), writeln(Trimmed).
:- split_string("/home//user/", "/", "", P), writeln(P).
:- atomic_list_concat(Parts, ',', 'x,y,z'), writeln(Parts).
:- atomic_list_concat([a, b, c], '-', Joined), writeln(Joined).
:- atomic_list_concat([a, 1, "s", 2.5], R), writeln(R).
:- split_string("one two  three", " ", "", W), exclude(==(""), W, Words), writeln(Words).
:- read_term_from_atom('foo(X, bar)', T, []), writeln(T).
:- term_to_atom(point(1, 2), A), writeln(A).
