sum_list_acc([], Acc, Acc).
sum_list_acc([H|T], Acc, S) :- Acc1 is Acc + H, sum_list_acc(T, Acc1, S).

% ?- sum_list_acc([1,2,3,4], 0, S).
