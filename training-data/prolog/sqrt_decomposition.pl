block_sums([], _, []) :- !.
block_sums(L, Bs, [S|Ss]) :-
    length(Pre, Bs), append(Pre, Rest, L), !, sum_list(Pre, S), block_sums(Rest, Bs, Ss).
block_sums(L, _, [S]) :- sum_list(L, S).

query(A, Blk, Bs, I, R, Acc, Acc) :- I > R, !.
query(A, Blk, Bs, I, R, Acc0, S) :-
    0 is I mod Bs, I + Bs - 1 =< R, !,
    B is I // Bs, nth0(B, Blk, V), Acc1 is Acc0 + V, I1 is I + Bs,
    query(A, Blk, Bs, I1, R, Acc1, S).
query(A, Blk, Bs, I, R, Acc0, S) :-
    nth0(I, A, V), Acc1 is Acc0 + V, I1 is I + 1,
    query(A, Blk, Bs, I1, R, Acc1, S).

:- A = [5,3,8,1,9,2,7,4,6,0,3,5], block_sums(A, 4, Blk), query(A, Blk, 4, 2, 9, 0, S), writeln(S).
