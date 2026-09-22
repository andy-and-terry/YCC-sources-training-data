% Longest common subsequence, returned as an explicit list rather than
% just its length. When heads match they are always kept (committed with
% a cut); otherwise the longer of "drop from the first list" and "drop
% from the second list" wins.
lcs([], _, []) :- !.
lcs(_, [], []) :- !.
lcs([H|T1], [H|T2], [H|L]) :- !, lcs(T1, T2, L).
lcs([H1|T1], [H2|T2], L) :-
    lcs(T1, [H2|T2], L1),
    lcs([H1|T1], T2, L2),
    ( length(L1, Len1), length(L2, Len2), Len1 >= Len2
    -> L = L1
    ;  L = L2
    ).

:- lcs([a, b, c], [b, c], L),
   length(L, Len),
   writeln(L), writeln(Len).

:- lcs([a, b, c, b, d, a, b], [b, d, c, a, b, a], L),
   length(L, Len),
   writeln(L), writeln(Len).
