:- T = f(X, Y, g(X, Z)), numbervars(T, 0, End), print(T), nl, writeln(End).
:- T = h(A, B), numbervars(T, 23, _), print(T), nl.
:- T = p(X, Y), \+ \+ ( numbervars(T, 0, _), print(T), nl ), print(T), nl.
:- T = q(X, X), numbervars(T, 0, _), write_canonical(T), nl.
:- T = foo(X, Y), copy_term(T, C), numbervars(C, 0, _), write_term(C, [numbervars(true), quoted(true)]), nl.
