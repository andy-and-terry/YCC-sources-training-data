prime(N) :- N >= 2, \+ ( between(2, N, I), I * I =< N, N mod I =:= 0 ).

rev(N, R) :- number_codes(N, Cs), reverse(Cs, Rs), number_codes(R, Rs).

emirp(P) :-
    between(2, 99, P), prime(P), rev(P, R), R =\= P, prime(R).

:- findall(P, emirp(P), Ps), writeln(Ps).
