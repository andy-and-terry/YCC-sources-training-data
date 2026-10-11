:- term_to_atom(foo(bar, [1, 2], "s"), Atom), writeln(Atom).
:- term_to_atom(T, 'likes(mary, X)'), writeln(T).
:- term_to_atom(f(X, Y, X), A), writeln(A).
:- with_output_to(string(S), print(point{x: 1})), writeln(S).
:- format(atom(A), "~q", ['Hello World']), writeln(A).
:- format(atom(A), "~w", ['Hello World']), writeln(A).
:- format(string(S), "~a-~d", [id, 7]), writeln(S).
:- with_output_to(atom(A), (write(a), write(' '), write(b))), writeln(A).
:- writeq('it''s'), nl, print([1, 'A b', "str"]), nl.
