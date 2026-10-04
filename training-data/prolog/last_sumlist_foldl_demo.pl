% foldl/4 and foldl/6 accumulate over one or two lists.
:- use_module(library(apply)).

add(X, Acc0, Acc) :- Acc is Acc0 + X.
dot_step(X, Y, Acc0, Acc) :- Acc is Acc0 + X * Y.
longest(W, Best0, Best) :-
    atom_length(W, L),
    atom_length(Best0, B),
    ( L > B -> Best = W ; Best = Best0 ).

:- foldl(add, [1, 2, 3, 4], 0, S), write(S), nl.
:- foldl(dot_step, [1, 2, 3], [4, 5, 6], 0, D), write(D), nl.
:- foldl(longest, [fig, banana, kiwi], '', W), write(W), nl.
:- foldl([X, A0, A]>>(A = [X|A0]), [a, b, c], [], Rev), write(Rev), nl.
