:- table stern/2.

stern(0, 0).
stern(1, 1).
stern(N, S) :-
    N > 1,
    N mod 2 =:= 0,
    H is N // 2,
    stern(H, S).
stern(N, S) :-
    N > 1,
    N mod 2 =:= 1,
    H is N // 2,
    H1 is H + 1,
    stern(H, A),
    stern(H1, B),
    S is A + B.

% ?- findall(S, (between(0, 14, N), stern(N, S)), L).
% L = [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3].
