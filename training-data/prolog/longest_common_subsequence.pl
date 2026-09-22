lcs([], _, []) :- !.
lcs(_, [], []) :- !.
lcs([X|Xs], [X|Ys], [X|Zs]) :- !, lcs(Xs, Ys, Zs).
lcs([X|Xs], [Y|Ys], Zs) :-
    lcs(Xs, [Y|Ys], Zs1),
    lcs([X|Xs], Ys, Zs2),
    ( length(Zs1, L1), length(Zs2, L2), L1 >= L2
    -> Zs = Zs1
    ;  Zs = Zs2
    ).

:- lcs([a,b,c,b,d,a,b], [b,d,c,a,b,a], Result),
   length(Result, Len),
   writeln(Result),
   writeln(Len).
