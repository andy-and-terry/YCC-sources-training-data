reverse_bits(V, R) :- reverse_bits(8, V, 0, R).

reverse_bits(0, _, Acc, Acc) :- !.
reverse_bits(K, V, Acc, R) :-
    Acc1 is (Acc << 1) \/ (V /\ 1),
    V1 is V >> 1,
    K1 is K - 1,
    reverse_bits(K1, V1, Acc1, R).

% ?- maplist(reverse_bits, [1, 6, 13, 128], L).
% L = [128, 96, 176, 1].
