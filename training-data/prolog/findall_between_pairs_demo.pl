% Generating pairs and triples with findall/3 and between/3.
pythagorean_triple(Max, A-B-C) :-
    between(1, Max, A),
    between(A, Max, B),
    C2 is A * A + B * B,
    C is truncate(sqrt(C2)),
    C =< Max,
    C * C =:= C2.

:- findall(T, pythagorean_triple(20, T), Ts), write(Ts), nl.

divisors(N, Ds) :-
    findall(D, (between(1, N, D), N mod D =:= 0), Ds).

:- divisors(28, Ds), write(Ds), nl.
:- findall(X-Y, (member(X, [1, 2]), member(Y, [a, b])), Pairs), write(Pairs), nl.
:- aggregate_all(count, pythagorean_triple(50, _), N), write(N), nl.
