prime_factors(N, Fs) :- N > 1, factors(N, 2, Fs).

factors(1, _, []) :- !.
factors(N, F, [F|Fs]) :-
    N mod F =:= 0, !,
    N1 is N // F,
    factors(N1, F, Fs).
factors(N, F, Fs) :-
    F * F > N, !,
    Fs = [N].
factors(N, F, Fs) :-
    F1 is F + 1,
    factors(N, F1, Fs).

:- prime_factors(360, Fs), writeln(Fs).
:- prime_factors(97, Fs), writeln(Fs).
:- prime_factors(1001, Fs), writeln(Fs).
