% Highest value reached by the Collatz (hailstone) sequence from N.
peak(N, Peak) :- peak(N, N, Peak).

peak(1, Best, Best) :- !.
peak(N, Best, Peak) :-
    (   N mod 2 =:= 0
    ->  Next is N // 2
    ;   Next is 3 * N + 1
    ),
    Best1 is max(Best, Next),
    peak(Next, Best1, Peak).

:- peak(27, P), print(P), nl.
