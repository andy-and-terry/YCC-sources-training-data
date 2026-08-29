factorial(N, F) :- factorial_helper(N, 1, F).

factorial_helper(0, Acc, Acc) :- !.
factorial_helper(N, Acc, F) :-
    N > 0,
    Acc1 is Acc * N,
    N1 is N - 1,
    factorial_helper(N1, Acc1, F).

:- factorial(10, F), writeln(F).
