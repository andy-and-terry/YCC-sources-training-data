% Emirps: primes whose digit reversal is a different prime.
prime(N) :- N >= 2, \+ (between(2, N, I), I * I =< N, N mod I =:= 0).

reverse_number(N, R) :-
    number_codes(N, Cs), reverse(Cs, Rs), number_codes(R, Rs).

emirp(N) :-
    between(2, 99, N),
    reverse_number(N, R),
    R \= N,
    prime(N),
    prime(R).

:- findall(N, emirp(N), L), print(L), nl.
