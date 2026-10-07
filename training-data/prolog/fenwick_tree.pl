% Fenwick (binary indexed) tree backed by a mutable compound term, used
% via nb_setarg so updates don't need to thread a new tree through.
fenwick_new(Size, Tree) :-
    N1 is Size + 1,
    functor(Tree, fenwick, N1),
    forall(between(1, N1, I), nb_setarg(I, Tree, 0)).

fenwick_update(Tree, Size, Index, Delta) :-
    I0 is Index + 1,
    update_loop(Tree, Size, I0, Delta).

update_loop(_, Size, I, _) :- I > Size, !.
update_loop(Tree, Size, I, Delta) :-
    I =< Size,
    arg(I, Tree, Cur),
    New is Cur + Delta,
    nb_setarg(I, Tree, New),
    Low is I /\ (-I),
    Next is I + Low,
    update_loop(Tree, Size, Next, Delta).

fenwick_prefix_sum(Tree, Index, Sum) :-
    I0 is Index + 1,
    sum_loop(Tree, I0, 0, Sum).

sum_loop(_, 0, Acc, Acc) :- !.
sum_loop(Tree, I, Acc, Sum) :-
    I > 0,
    arg(I, Tree, Val),
    Acc1 is Acc + Val,
    Low is I /\ (-I),
    Next is I - Low,
    sum_loop(Tree, Next, Acc1, Sum).

:- Values = [3, 2, -1, 6, 5, 4, -3, 3, 7, 2],
   length(Values, Size),
   fenwick_new(Size, Tree),
   forall(nth0(I, Values, V), fenwick_update(Tree, Size, I, V)),
   fenwick_prefix_sum(Tree, 9, Total),
   fenwick_prefix_sum(Tree, 2, Partial),
   format("total=~w partial=~w~n", [Total, Partial]).
