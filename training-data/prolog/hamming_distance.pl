hamming([], [], 0).
hamming([X|Xs], [Y|Ys], D) :-
    hamming(Xs, Ys, D0),
    ( X == Y -> D = D0 ; D is D0 + 1 ).

hamming_atoms(A, B, D) :-
    atom_chars(A, As),
    atom_chars(B, Bs),
    hamming(As, Bs, D).

bit_distance(X, Y, D) :-
    Z is X xor Y,
    popcount(Z, D).

popcount(0, 0) :- !.
popcount(N, C) :-
    N1 is N /\ (N - 1),
    popcount(N1, C0),
    C is C0 + 1.

:- hamming_atoms(karolin, kathrin, D), writeln(D).
:- bit_distance(0b1011, 0b0110, D), writeln(D).
