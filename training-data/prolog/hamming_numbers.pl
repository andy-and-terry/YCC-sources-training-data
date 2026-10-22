% Hamming numbers (5-smooth): only prime factors 2, 3 and 5
strip(N, P, R) :-
    N mod P =:= 0, !,
    M is N // P,
    strip(M, P, R).
strip(N, _, N).

hamming(N) :-
    strip(N, 2, A),
    strip(A, 3, B),
    strip(B, 5, 1).

main :-
    findall(N, (between(1, 100, N), hamming(N)), All),
    length(First, 20),
    append(First, _, All),
    atomic_list_concat(First, ' ', Line),
    writeln(Line).

:- initialization(main).
