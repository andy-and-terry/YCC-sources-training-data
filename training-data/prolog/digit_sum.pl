digit_sum(N, Sum) :-
    N < 10, !,
    Sum = N.
digit_sum(N, Sum) :-
    N1 is N // 10,
    digit_sum(N1, SubSum),
    Sum is Sum1 + (N mod 10),
    Sum1 = SubSum.

:- digit_sum(12345, Sum), writeln(Sum).
