% The Ackermann function: a total computable function that grows so
% fast it is not primitive recursive, illustrating recursion nested in
% both of its own arguments.
ackermann(0, N, R) :- !, R is N + 1.
ackermann(M, 0, R) :- !, M1 is M - 1, ackermann(M1, 1, R).
ackermann(M, N, R) :-
    M > 0, N > 0,
    M1 is M - 1, N1 is N - 1,
    ackermann(M, N1, R1),
    ackermann(M1, R1, R).

:- ackermann(2, 3, R), writeln(R).
:- ackermann(3, 3, R), writeln(R).
