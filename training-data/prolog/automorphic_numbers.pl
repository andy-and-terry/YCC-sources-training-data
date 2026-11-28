automorphic(N) :-
    Sq is N * N,
    number_codes(Sq, SqCodes),
    number_codes(N, NCodes),
    append(_, NCodes, SqCodes).

% ?- findall(N, (between(0, 999, N), automorphic(N)), L).
% L = [0, 1, 5, 6, 25, 76, 376, 625].
