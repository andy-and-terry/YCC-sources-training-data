make_prefix(Vs, [0 | Ps]) :- prefix_(Vs, 0, Ps).

prefix_([], _, []).
prefix_([V | Vs], Acc, [Acc1 | Rest]) :-
    Acc1 is Acc + V,
    prefix_(Vs, Acc1, Rest).

query(P, Lo, Hi, S) :- nth0(Lo, P, A), nth0(Hi, P, B), S is B - A.

:- make_prefix([3,1,4,1,5,9,2,6], P), query(P, 2, 5, S), writeln(S).
