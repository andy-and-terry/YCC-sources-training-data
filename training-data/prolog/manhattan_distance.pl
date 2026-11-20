% Manhattan distance.
manhattan(A, B, D) :- maplist([X, Y, Z]>>(Z is abs(X - Y)), A, B, Ds), sum_list(Ds, D).
:- manhattan([1, 2], [4, 6], D), print(D), nl.
