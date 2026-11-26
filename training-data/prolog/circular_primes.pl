% Circular primes below 100; expect 13.
prime(N) :- N > 1, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

rotation(N, R) :-
    atom_chars(N, Cs), append(A, B, Cs), A \== [], append(B, A, Rs),
    atom_chars(Atom, Rs), atom_number(Atom, R).
circular(N) :- prime(N), \+ (rotation(N, R), \+ prime(R)).
:- aggregate_all(count, (between(2, 99, N), circular(N)), C), writeln(C).
