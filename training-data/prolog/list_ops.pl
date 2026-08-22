sum_list_custom([], 0).
sum_list_custom([H|T], Sum) :- sum_list_custom(T, Rest), Sum is H + Rest.

max_list_custom([X], X).
max_list_custom([H|T], Max) :- max_list_custom(T, TailMax), (H > TailMax -> Max = H ; Max = TailMax).

:- sum_list_custom([1,2,3,4,5], Sum), writeln(Sum).
:- max_list_custom([5,3,8,1,9,2], Max), writeln(Max).
