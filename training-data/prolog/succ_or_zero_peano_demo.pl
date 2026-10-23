add(0, Y, Y).
add(s(X), Y, s(Z)) :- add(X, Y, Z).

mul(0, _, 0).
mul(s(X), Y, Z) :- mul(X, Y, W), add(W, Y, Z).

to_peano(0, 0) :- !.
to_peano(N, s(P)) :- N1 is N - 1, to_peano(N1, P).

main :-
    to_peano(2, A), to_peano(3, B),
    mul(A, B, C),
    writeln(C),
    findall(X-Y, add(X, Y, s(s(0))), Pairs),
    writeln(Pairs).

:- initialization(main).
