% Emirps: primes whose digit reversal is a different prime.
prime(N) :- N >= 2, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

reverse_num(N, R) :-
    number_codes(N, Cs), reverse(Cs, Rs), number_codes(R, Rs).

emirp(N) :- reverse_num(N, R), R =\= N, prime(N), prime(R).

main :-
    findall(N, (between(2, 199, N), emirp(N)), L),
    atomic_list_concat(L, ' ', Out),
    writeln(Out).

:- initialization(main).
