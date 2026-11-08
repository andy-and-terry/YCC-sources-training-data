f(X, Y) :- Y is X*X - 2.

secant(_, B, 0, B) :- !.
secant(A, B, N, R) :-
    f(A, FA), f(B, FB),
    ( FA =:= FB -> R = B
    ; C is B - FB * (B - A) / (FB - FA),
      N1 is N - 1,
      secant(B, C, N1, R) ).

:- secant(1.0, 2.0, 40, R), format("~8f~n", [R]).
