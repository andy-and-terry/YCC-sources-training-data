fact(0, 1) :- !.
fact(N, F) :- N > 0, N1 is N - 1, fact(N1, F1), F is N * F1.

fib(0, 0). fib(1, 1).
fib(N, F) :- N > 1, A is N - 1, B is N - 2, fib(A, FA), fib(B, FB), F is FA + FB.

:- fact(10, F), writeln(F).
:- fib(15, F), writeln(F).
:- X is 17 mod 5 + 2 ** 3, writeln(X).
