:- use_module(library(apply)).
:- use_module(library(yall)).

add(X, A0, A) :- A is A0 + X.

main :-
    foldl(add, [1,2,3,4], 0, S),
    format("sum=~w~n", [S]),
    foldl([X,A0,A]>>(A is max(X,A0)), [3,9,2], 0, M),
    format("max=~w~n", [M]).

:- initialization(main).
