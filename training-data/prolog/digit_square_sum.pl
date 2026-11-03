digit_square_sum(N, S) :- N < 0, !, M is -N, digit_square_sum(M, S).
digit_square_sum(0, 0) :- !.
digit_square_sum(N, S) :-
    D is N mod 10,
    R is N // 10,
    digit_square_sum(R, S0),
    S is S0 + D * D.

:- digit_square_sum(123, S), writeln(S).
:- digit_square_sum(-99, S), writeln(S).
