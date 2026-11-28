digits(N, [N]) :- N < 10, !.
digits(N, Ds) :-
    D is N mod 10,
    R is N // 10,
    digits(R, Rs),
    append(Rs, [D], Ds).

armstrong(N) :-
    digits(N, Ds),
    length(Ds, Len),
    foldl([D, A0, A]>>(A is A0 + D ** Len), Ds, 0, N).

% ?- findall(N, (between(1, 999, N), armstrong(N)), L).
% L = [1, 2, 3, 4, 5, 6, 7, 8, 9, 153, 370, 371, 407].
