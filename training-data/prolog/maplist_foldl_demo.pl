:- use_module(library(apply)).
:- use_module(library(lists)).

square(X, Y) :- Y is X * X.

sum_acc(X, Acc0, Acc) :- Acc is Acc0 + X.

:- numlist(1, 5, Numbers),
   maplist(square, Numbers, Squares),
   writeln(Squares),
   foldl(sum_acc, Squares, 0, Total),
   writeln(Total).

:- maplist([X]>>(Y is X * 2, writeln(Y)), [1, 2, 3]).
