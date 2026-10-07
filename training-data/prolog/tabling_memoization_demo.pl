% SWI-Prolog's `table` directive memoizes a predicate automatically: every
% distinct call is computed once and cached, turning naive recursive
% Fibonacci from exponential-time (each fib(N) is recomputed from scratch
% for every caller) into linear-time without hand-rolled memoization.
:- table fib/2.

fib(0, 0).
fib(1, 1).
fib(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.

:- fib(30, F), writeln(F).
