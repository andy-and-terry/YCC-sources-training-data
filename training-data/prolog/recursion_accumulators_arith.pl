fact(0, 1) :- !.
fact(N, F) :- N1 is N - 1, fact(N1, F1), F is N * F1.

fact_acc(N, F) :- fact_acc(N, 1, F).
fact_acc(0, A, A) :- !.
fact_acc(N, A, F) :- A1 is A * N, N1 is N - 1, fact_acc(N1, A1, F).

fib(0, 0). fib(1, 1).
fib(N, F) :- N > 1, A is N - 1, B is N - 2, fib(A, FA), fib(B, FB), F is FA + FB.

gcd(A, 0, A) :- !.
gcd(A, B, G) :- R is A mod B, gcd(B, R, G).

len([], 0).
len([_|T], N) :- len(T, M), N is M + 1.

power(_, 0, 1) :- !.
power(B, E, R) :- E1 is E - 1, power(B, E1, R1), R is B * R1.

hanoi(0, _, _, _) :- !.
hanoi(N, F, T, V) :- N1 is N - 1, hanoi(N1, F, V, T), hanoi(N1, V, T, F).

main :-
    fact(20, F), fact_acc(25, F2), fib(15, Fb), gcd(48, 18, G), len([a, b, c], L), power(2, 30, P),
    format("~w ~w ~w ~w ~w ~w~n", [F, F2, Fb, G, L, P]),
    X is 17 mod 5, Y is -17 // 5, Z is truncate(3.99), W is 2 ** 0.5, V is max(3, 9) + min(1, 2),
    format("~w ~w ~w ~4f ~w~n", [X, Y, Z, W, V]),
    A is cot(1.0) * 0 + abs(-3) + sign(-5) + gcd(12, 18) + msb(1024),
    format("~w~n", [A]).
:- initialization(main).
