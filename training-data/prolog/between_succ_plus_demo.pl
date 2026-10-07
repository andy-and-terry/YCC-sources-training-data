% between/3 generates integers; succ/2 and plus/3 work in several modes.
:- findall(X, between(1, 5, X), L), writeln(L).
:- between(1, inf, N), N * N > 50, !, writeln(N).
:- succ(3, X), writeln(X).
:- succ(Y, 10), writeln(Y).
:- plus(2, 3, Z), writeln(Z).
:- plus(2, A, 10), writeln(A).
:- ( between(1, 3, 7) -> writeln(yes) ; writeln(no) ).
