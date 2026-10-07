lcs([], _, []) :- !.
lcs(_, [], []) :- !.
lcs([H|T1], [H|T2], [H|R]) :- !, lcs(T1, T2, R).
lcs([H1|T1], [H2|T2], R) :-
    H1 \= H2,
    lcs(T1, [H2|T2], R1),
    lcs([H1|T1], T2, R2),
    ( length(R1, L1), length(R2, L2), L1 >= L2 -> R = R1 ; R = R2 ).

:- string_chars("ABCBDAB", A), string_chars("BDCABA", B),
   lcs(A, B, R), string_chars(S, R), writeln(S).
