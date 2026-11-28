prime(N) :- N >= 2, \+ ( between(2, N, I), I * I =< N, N mod I =:= 0 ).

cuban(P) :-
    between(1, inf, Y),
    P is 3 * Y * Y + 3 * Y + 1,
    prime(P).

:- findall(P, limit(8, cuban(P)), Ps), writeln(Ps).
