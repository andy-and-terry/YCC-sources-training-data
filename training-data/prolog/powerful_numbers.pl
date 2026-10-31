:- initialization(main).

prime_factors(N, Fs) :- prime_factors(N, 2, Fs).

prime_factors(1, _, []) :- !.
prime_factors(N, P, [N]) :- P * P > N, !.
prime_factors(N, P, [P|Fs]) :- 0 is N mod P, !, N1 is N // P, prime_factors(N1, P, Fs).
prime_factors(N, P, Fs) :- P1 is P + 1, prime_factors(N, P1, Fs).

powerful(N) :-
    prime_factors(N, Fs),
    sort(Fs, Unique),
    forall(member(P, Unique),
           ( include(==(P), Fs, Same), length(Same, C), C >= 2 )).

main :-
    findall(N, (between(1, 100, N), powerful(N)), Ns),
    print(Ns), nl.
