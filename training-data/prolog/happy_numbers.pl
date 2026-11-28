digit_square_sum(0, 0) :- !.
digit_square_sum(N, S) :-
    D is N mod 10,
    R is N // 10,
    digit_square_sum(R, S0),
    S is S0 + D * D.

happy(N) :- happy(N, []).
happy(1, _) :- !.
happy(N, Seen) :-
    \+ memberchk(N, Seen),
    digit_square_sum(N, Next),
    happy(Next, [N | Seen]).

% ?- findall(N, (between(1, 40, N), happy(N)), L).
% L = [1, 7, 10, 13, 19, 23, 28, 31, 32, 44].
