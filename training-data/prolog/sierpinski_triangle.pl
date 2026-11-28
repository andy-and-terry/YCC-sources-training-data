cell(R, C, Ch) :- ( R /\ C =:= C -> Ch = "* " ; Ch = "  " ).

row(N, R) :-
    Pad is N - R - 1,
    forall(between(1, Pad, _), write(' ')),
    forall(between(0, R, C), ( cell(R, C, S), write(S) )),
    nl.

main :- N = 8, M is N - 1, forall(between(0, M, R), row(N, R)).

:- main.
