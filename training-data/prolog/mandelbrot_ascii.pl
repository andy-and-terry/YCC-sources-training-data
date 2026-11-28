escape(Cr, Ci, N) :- escape(0.0, 0.0, Cr, Ci, 0, N).

escape(_, _, _, _, 30, 30) :- !.
escape(Zr, Zi, _, _, N, N) :- Zr * Zr + Zi * Zi >= 4, !.
escape(Zr, Zi, Cr, Ci, N0, N) :-
    Zr1 is Zr * Zr - Zi * Zi + Cr,
    Zi1 is 2 * Zr * Zi + Ci,
    N1 is N0 + 1,
    escape(Zr1, Zi1, Cr, Ci, N1, N).

cell(Xi, Yi, C) :-
    escape(Xi / 20, Yi / 5, N), ( N =:= 30 -> C = 0'# ; C = 0'. ).

main :-
    forall(between(-5, 5, Yi),
           ( findall(C, (between(-40, 12, Xi), cell(Xi, Yi, C)), Cs),
             format("~s~n", [Cs]) )).

:- main.
