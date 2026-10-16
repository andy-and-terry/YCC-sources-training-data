:- read_term_from_atom('foo(X, bar, Y)', T, []), writeln(T).
:- term_string(T, "a + b * c"), T = A + B, writeln(A), writeln(B).
:- term_to_atom(T, 'X is 2 + 3'), call(T), writeln(T).
:- open_string("first(1). second(2). third(3).", S),
   read(S, T1), read(S, T2), read(S, T3), read(S, End),
   close(S), writeln([T1, T2, T3, End]).
:- catch(term_to_atom(_, 'foo('), error(syntax_error(E), _), (writeln(syntax_error(E)))).
:- open_string("line one\nline two", S), read_line_to_string(S, L1), read_line_to_string(S, L2), read_line_to_string(S, L3), writeln([L1, L2, L3]).
