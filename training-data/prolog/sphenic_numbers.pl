:- initialization(main).

prime_factors(N, Fs) :- prime_factors(N, 2, Fs).

prime_factors(1, _, []) :- !.
prime_factors(N, P, [N]) :- P * P > N, !.
prime_factors(N, P, [P|Fs]) :- 0 is N mod P, !, N1 is N // P, prime_factors(N1, P, Fs).
prime_factors(N, P, Fs) :- P1 is P + 1, prime_factors(N, P1, Fs).

sphenic(N) :-
    prime_factors(N, Fs),
    length(Fs, 3),
    sort(Fs, Unique),
    length(Unique, 3).

main :-
    findall(N, (between(2, 79, N), sphenic(N)), Ns),
    print(Ns), nl.
