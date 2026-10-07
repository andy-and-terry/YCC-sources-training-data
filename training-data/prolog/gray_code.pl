gray(0, [[]]) :- !.
gray(N, Codes) :-
    N1 is N - 1,
    gray(N1, Prev),
    reverse(Prev, Rev),
    maplist(prefix_bit(0), Prev, Zeros),
    maplist(prefix_bit(1), Rev, Ones),
    append(Zeros, Ones, Codes).

prefix_bit(B, C, [B|C]).

gray_int(I, G) :- G is I xor (I >> 1).

:- gray(3, Cs), forall(member(C, Cs), (atomic_list_concat(C, S), writeln(S))).
:- findall(G, (between(0, 7, I), prefix_bit(B, C, [B|C]).

gray_int(I, G)), Gs), writeln(Gs).
