:- append(X, [3], [1, 2, 3]), write(X), nl.
:- findall(A-B, append(A, B, [1, 2]), L), write(L), nl.
:- ( member(2, [1, 2, 3]) -> writeln(yes) ; writeln(no) ).
:- nth0(1, [a, b, c], E), writeln(E).
:- reverse([1, 2, 3], R), writeln(R).
