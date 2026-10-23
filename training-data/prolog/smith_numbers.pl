% Smith numbers below 100: composite numbers whose digit sum equals the
% digit sum of their prime factors (counted with multiplicity).
digit_sum(N, N) :- N < 10, !.
digit_sum(N, S) :-
    D is N mod 10,
    R is N // 10,
    digit_sum(R, S0),
    S is S0 + D.

prime_factors(N, Fs) :- prime_factors(N, 2, Fs).

prime_factors(1, _, []) :- !.
prime_factors(N, P, [N]) :- P * P > N, !.
prime_factors(N, P, [P|Fs]) :-
    N mod P =:= 0, !,
    N1 is N // P,
    prime_factors(N1, P, Fs).
prime_factors(N, P, Fs) :-
    P1 is P + 1,
    prime_factors(N, P1, Fs).

smith(N) :-
    prime_factors(N, Fs),
    length(Fs, Len),
    Len > 1,
    digit_sum(N, S),
    maplist(digit_sum, Fs, Ds),
    sum_list(Ds, S).

:- findall(N, (between(4, 99, N), smith(N)), Ns),
   atomic_list_concat(Ns, ' ', Line),
   writeln(Line).
