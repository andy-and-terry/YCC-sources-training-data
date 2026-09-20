lcs([], _, []) :- !.
lcs(_, [], []) :- !.
lcs([H|T1], [H|T2], [H|T3]) :- !, lcs(T1, T2, T3).
lcs([H1|T1], [H2|T2], Longest) :-
    lcs([H1|T1], T2, L1),
    lcs(T1, [H2|T2], L2),
    ( length(L1, Len1), length(L2, Len2), Len1 >= Len2
    -> Longest = L1
    ;  Longest = L2
    ).

:- string_chars("ABCBDAB", A),
   string_chars("BDCABA", B),
   lcs(A, B, Longest),
   length(Longest, Len),
   atomic_list_concat(Longest, Sub),
   format("~w (length ~w)~n", [Sub, Len]).
