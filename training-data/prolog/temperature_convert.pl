convert(c, f, C, F) :- F is C * 9 / 5 + 32.
convert(f, c, F, C) :- C is (F - 32) * 5 / 9.
convert(c, k, C, K) :- K is C + 273.15.
convert(k, c, K, C) :- C is K - 273.15.
convert(U, U, X, X).
convert(From, To, X, Y) :-
    From \== To,
    \+ clause_exists(From, To),
    convert(From, c, X, Mid),
    convert(c, To, Mid, Y).

clause_exists(From, To) :-
    member(From-To, [c-f, f-c, c-k, k-c]).

:- convert(c, f, 100, F), format("100 C = ~1f F~n", [F]).
:- convert(f, c, 98.6, C), format("98.6 F = ~1f C~n", [C]).
:- convert(f, k, 32, K), format("32 F = ~2f K~n", [K]).
