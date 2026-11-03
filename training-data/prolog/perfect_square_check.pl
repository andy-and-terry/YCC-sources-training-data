perfect_square(N) :-
    N >= 0,
    R is round(sqrt(N)),
    R * R =:= N.

:- findall(N, (between(0, 29, N), perfect_square(N)), L), writeln(L).
