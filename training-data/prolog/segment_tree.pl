% Segment tree for range-sum queries, represented as a nested term
% seg(Sum, Left, Right) built bottom-up over an index range.
build_seg(Values, Lo, Hi, seg(Sum, leaf, leaf)) :-
    Lo == Hi, !,
    nth0(Lo, Values, Sum).
build_seg(Values, Lo, Hi, seg(Sum, LNode, RNode)) :-
    Mid is (Lo + Hi) // 2,
    build_seg(Values, Lo, Mid, LNode),
    build_seg(Values, Mid + 1, Hi, RNode),
    seg_sum(LNode, LSum),
    seg_sum(RNode, RSum),
    Sum is LSum + RSum.

seg_sum(seg(Sum, _, _), Sum).

query(seg(Sum, _, _), Lo, Hi, QLo, QHi, Sum) :- QLo =< Lo, Hi =< QHi, !.
query(_, Lo, Hi, QLo, QHi, 0) :- (QHi < Lo ; Hi < QLo), !.
query(seg(_, LNode, RNode), Lo, Hi, QLo, QHi, Result) :-
    Mid is (Lo + Hi) // 2,
    query(LNode, Lo, Mid, QLo, QHi, LResult),
    query(RNode, Mid + 1, Hi, QLo, QHi, RResult),
    Result is LResult + RResult.

:- Values = [3, 2, -1, 6, 5, 4, -3, 3, 7, 2],
   length(Values, N),
   build_seg(Values, 0, N - 1, Tree),
   query(Tree, 0, N - 1, 0, 5, R1),
   query(Tree, 0, N - 1, 3, 7, R2),
   format("sum(0,5)=~w sum(3,7)=~w~n", [R1, R2]).
