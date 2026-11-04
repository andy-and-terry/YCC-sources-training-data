ugly(N, X) :- ugly_([1], 1, 1, 1, N, Seq), nth1(N, Seq, X).

ugly_(Seq, _, _, _, N, Seq) :- length(Seq, L), L >= N, !.
ugly_(Seq, I2, I3, I5, N, Out) :-
    nth1(I2, Seq, A), nth1(I3, Seq, B), nth1(I5, Seq, C),
    C2 is A * 2, C3 is B * 3, C5 is C * 5,
    Next is min(C2, min(C3, C5)),
    append(Seq, [Next], Seq1),
    ( Next =:= C2 -> J2 is I2 + 1 ; J2 = I2 ),
    ( Next =:= C3 -> J3 is I3 + 1 ; J3 = I3 ),
    ( Next =:= C5 -> J5 is I5 + 1 ; J5 = I5 ),
    ugly_(Seq1, J2, J3, J5, N, Out).

:- findall(X, (between(1, 12, I), ugly(I, X)), L), writeln(L).
