:- use_module(library(apply)).

even(X) :- 0 is X mod 2.

:- include(even, [1, 2, 3, 4, 5, 6], Evens), writeln(Evens).
:- exclude(even, [1, 2, 3, 4, 5, 6], Odds), writeln(Odds).
:- partition(even, [1, 2, 3, 4, 5, 6], In, Out), writeln(In-Out).
:- partition([X, C]>>compare(C, X, 3), [1, 5, 3, 2, 4], L, E, G),
   writeln(L/E/G).
:- foldl([X, A0, A]>>(A is max(X, A0)), [3, 9, 2], 0, Max), writeln(Max).
:- aggregate_all(count, (member(X, [1, 2, 3, 4]), X > 2), N), writeln(N).
